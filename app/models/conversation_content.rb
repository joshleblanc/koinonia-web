# == Schema Information
#
# Table name: conversation_contents
#
#  id              :bigint           not null, primary key
#  role            :string
#  text            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  conversation_id :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_conversation_contents_on_conversation_id  (conversation_id)
#  index_conversation_contents_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (conversation_id => conversations.id)
#  fk_rails_...  (user_id => users.id)
#
class ConversationContent < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  broadcasts_to ->(model) { [model.conversation, :contents] }, target: "conversation_contents"

  def for_request
    if conversation.conversation_contents.order(:created_at).first == self 
      { role:, parts: [ *base_parts,{ text: } ]}

    else 
      { role:, parts: [ { text: } ]}
    end
  end

  def base_parts 
    GeminiConfig.instance.gemini_config_parts.pluck(:text).map { { text: _1 } }
  end

  ## 
  # [
  #   { text: "input: I'm developing a UGC gaming platform with an AI assistant that will help both with the codebase and with the overall use of the platform. For the chatbot I wanto to have a common structure for the outputs in JSON format. So, since the same output can contain different types (text, code, image...) I want to divide each segment into its own JSON object, with a type, the content and any other info it could have." },
  #   {
  #     text: <<~OUTPUT
  #       output: ```json
  #       [
  #         {
  #           "type": "text",
  #           "content": "Hello! How can I help you today?",
  #           "style": "informal"
  #         },
  #         {
  #           "type": "code",
  #           "language": "lua",
  #           "content": "print('Hello, world!')",
  #           "executable": true,
  #           "description": "This code prints 'Hello, world!' to the console."
  #         },
  #         {
  #           "type": "image",
  #           "url": "https://example.com/image.png/",
  #           "alt": "A helpful diagram",
  #           "caption": "This diagram explains the concept."
  #           }
  #         ]
  #       ```
  #       *Explanation:**
        
  #       * **Array of Objects:** The output is structured as a JSON array (`[]`), where each element represents a separate segment of the response.
  #       * **Type Field:** Each object has a `type` field indicating the nature of the content (e.g., \"text\", \"code\", \"image\", \"audio\", \"video\", \"link\").
  #       * **Content Field:** The `content` field holds the actual data:
  #         * For \"text\": The text string itself.
  #         * For \"code\": The code snippet.
  #         * For \"image\", \"audio\", \"video\":  A URL to the resource.
  #       * **Additional Metadata:** Other fields provide context and metadata relevant to the specific type. For example:\n    * `style`: For \"text\", specifies the tone (e.g., \"formal\", \"informal\", \"technical\").
  #         * `language`: For \"code\", indicates the programming language.
  #         * `executable`: For \"code\", indicates if the code can be run directly.
  #         * `description`: Provides a brief explanation of the content.
  #         * `url`: For media types, the URL of the resource.
  #         * `alt`: For images, alternative text for accessibility.
  #         * `caption`:  A brief description of the media.
          
  #       **Advantages of this structure:**
        
  #       * **Flexibility:**  Handles various content types within a single response.
  #       * **Clear Organization:** Makes the response structure predictable and easy to parse for different clients (web, mobile, etc.).
  #       * **Machine-Readable:** Facilitates automated processing and integration of the AI assistant's responses.
        
  #       **Remember to adapt and extend this structure based on the specific needs and features of your UGC gaming platform and the capabilities of your AI assistant.**
  #     OUTPUT
  #   }

  # ]
end
