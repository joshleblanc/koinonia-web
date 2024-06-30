json.extract! conversation_content, :id, :user_id, :role, :text, :token_count, :created_at, :updated_at
json.url conversation_content_url(conversation_content, format: :json)
