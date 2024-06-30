class AddRateLimitsToGeminiConfigs < ActiveRecord::Migration[7.1]
  def change
    add_column :gemini_configs, :tokens_per_minute, :integer, default: 1_000_000
    add_column :gemini_configs, :requests_per_minute, :integer, default: 15
  end
end
