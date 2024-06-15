class ConversationContent < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  def for_request
    { role:, parts: [ { text: } ]}
  end
end
