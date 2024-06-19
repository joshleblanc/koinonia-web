# == Schema Information
#
# Table name: conversations
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_conversations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Conversation < ApplicationRecord
  belongs_to :user
  has_many :conversation_contents, dependent: :destroy

  broadcasts_refreshes

  def receive_message

    body =  {
      contents: conversation_contents.order(:created_at).map(&:for_request) 
    }

    Rails.logger.debug body

    response = GeminiClient.instance.generate_content(body)

    Rails.logger.debug response

    conversation_contents.build(
      role: "model",
      text: response["candidates"].first["content"]["parts"].first["text"],
      user:
    )
  end

  def send_message(what)
    conversation_contents.build(
      role: "user",
      text: what,
      user:
    )
  end
end
