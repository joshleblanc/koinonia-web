class ConversationContent < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  broadcasts_to ->(model) { [model.conversation, :contents] }, target: "conversation_contents"

  def for_request
    { role:, parts: [ { text: } ]}
  end
end
