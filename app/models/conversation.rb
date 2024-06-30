# == Schema Information
#
# Table name: conversations
#
#  id                   :bigint           not null, primary key
#  send_baseline_prompt :boolean          default(TRUE)
#  send_documentation   :boolean          default(TRUE)
#  send_project_code    :boolean          default(TRUE)
#  title                :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :bigint           not null
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

    content = conversation_contents.order(:created_at)

    new_content = content.last

    body =  {
      contents: content.map(&:for_request) 
    }

    Rails.logger.debug body

    response = GeminiClient.instance.generate_content(body)

    Rails.logger.debug response

    new_content.update(token_count: response["usageMetadata"]["promptTokenCount"] - content.sum(:token_count))

    conversation_contents.build(
      role: "model",
      text: response["candidates"].first["content"]["parts"].first["text"],
      user:,
      token_count: response["usageMetadata"]["candidatesTokenCount"]
    )
  end

  def send_message(what)
    conversation_contents.build(
      role: "user",
      text: what,
      user:
    )
  end

  def token_count 
    conversation_contents.sum(:token_count)
  end
end
