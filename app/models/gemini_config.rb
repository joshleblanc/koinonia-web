class GeminiConfig < ApplicationRecord
    has_many :gemini_config_parts, dependent: :destroy

    def self.instance 
        first_or_create
    end
end
