class AddGeminiKeyToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :gemini_key, :string
  end
end
