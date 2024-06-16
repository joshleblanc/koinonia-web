class CreateGeminiConfigParts < ActiveRecord::Migration[7.1]
  def change
    create_table :gemini_config_parts do |t|
      t.text :text
      t.belongs_to :gemini_config, null: false, foreign_key: true

      t.timestamps
    end
  end
end
