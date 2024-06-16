class GeminiConfigPart < ApplicationRecord
  belongs_to :gemini_config, touch: true

  broadcasts_to ->(model) { [model.gemini_config, :parts] }, target: "gemini_config_parts"
end
