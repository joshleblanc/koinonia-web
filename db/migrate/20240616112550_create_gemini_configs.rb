class CreateGeminiConfigs < ActiveRecord::Migration[7.1]
  def change
    create_table :gemini_configs do |t|
      t.timestamps
    end
  end
end
