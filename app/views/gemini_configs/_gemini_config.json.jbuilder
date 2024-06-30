json.extract! gemini_config, :id, :tokens_per_minute, :requests_per_minute, :requests_per_day, :created_at, :updated_at
json.url gemini_config_url(gemini_config, format: :json)
