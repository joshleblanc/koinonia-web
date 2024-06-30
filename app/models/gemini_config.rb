# == Schema Information
#
# Table name: gemini_configs
#
#  id             :bigint           not null, primary key
#  maximum_tokens :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class GeminiConfig < ApplicationRecord
    has_many :gemini_config_parts, dependent: :destroy

    has_one_attached :documentation

    after_commit :process_documentation, if: -> { attachment_changes["documentation"].present? }

    def self.instance 
        first_or_create
    end

    def process_documentation
        return unless documentation.attached?

        tempfile = Tempfile.new(binmode: true)
        tempfile.write(documentation.download)
        tempfile.close

        @documentation_contents = ["The following is the documentation for the UGC gaming platform"]

        Zip::File.open(tempfile.path) do |zip|
            zip.each do |entry|
                next unless entry.file?
                next if entry.name.include?("tutorial")


                @documentation_contents << 
                    <<~FILE
                        # #{entry.name}
                        
                        #{entry.get_input_stream.read}
                    FILE
            end
        end

        @documentation_contents
    end

    def documentation_contents
        process_documentation unless @documentation_contents
        @documentation_contents
    end
end
