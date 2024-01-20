json.extract! game, :id, :name, :description, :created_at, :updated_at, :user_id
json.latest_game_version_id game.latest_game_version&.id
json.latest_published_game_version_id game.latest_published_game_version&.id
json.editable current_user == game.user
json.url game_url(game, format: :json)
