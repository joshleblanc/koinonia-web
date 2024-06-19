# == Schema Information
#
# Table name: gemini_configs
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GeminiConfig < ApplicationRecord
    has_many :gemini_config_parts, dependent: :destroy

    def self.instance 
        first_or_create
    end
end
