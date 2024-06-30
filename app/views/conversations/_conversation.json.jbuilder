json.extract! conversation, :id, :title, :send_baseline_prompt, :send_documentation, :send_project_code, :token_count, :user_id, :created_at, :updated_at
json.url conversation_url(conversation, format: :json)
