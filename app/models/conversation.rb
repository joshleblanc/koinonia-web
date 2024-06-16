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
