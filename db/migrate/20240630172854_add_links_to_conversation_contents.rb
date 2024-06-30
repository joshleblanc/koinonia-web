class AddLinksToConversationContents < ActiveRecord::Migration[7.1]
  def up
    add_reference :conversation_contents, :next, null: true, foreign_key: { to_table: :conversation_contents }
    add_reference :conversation_contents, :prev, null: true, foreign_key: { to_table: :conversation_contents }

    Conversation.find_each do |conversation|
      last = nil
      conversation.conversation_contents.order(created_at: :asc).find_each do |content|
        if last 
          content.update(prev_id: last.id)
          last.update(next_id: content.id)
        end
        last = content
      end
    end
  end

  def down 
    remove_reference :conversation_contents, :next
    remove_reference :conversation_contents, :prev
  end
end
