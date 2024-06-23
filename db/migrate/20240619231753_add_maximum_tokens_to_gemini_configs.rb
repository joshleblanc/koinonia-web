class AddMaximumTokensToGeminiConfigs < ActiveRecord::Migration[7.1]
  def change
    add_column :gemini_configs, :maximum_tokens, :integer
  end
end
