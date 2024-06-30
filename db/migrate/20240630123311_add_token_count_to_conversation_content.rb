class AddTokenCountToConversationContent < ActiveRecord::Migration[7.1]
  def change
    add_column :conversation_contents, :token_count, :integer, default: 0
  end
end
