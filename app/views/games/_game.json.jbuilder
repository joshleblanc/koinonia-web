json.extract! game, :id, :name, :description, :created_at, :updated_at, :user_id, :latest_game_version_id, :latest_published_game_version_id
json.editable current_user == game.user

if game.cover_image.attached?
  json.cover_image_url url_for(game.cover_image)
end

json.url game_url(game, format: :json)
