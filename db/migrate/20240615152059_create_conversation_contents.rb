class CreateConversationContents < ActiveRecord::Migration[7.1]
  def change
    create_table :conversation_contents do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :conversation, null: false, foreign_key: true
      t.string :role
      t.text :text

      t.timestamps
    end
  end
end
