json.extract! game, :id, :name, :description, :created_at, :updated_at
json.latest_game_version_id game.latest_game_version&.id
json.url game_url(game, format: :json)
