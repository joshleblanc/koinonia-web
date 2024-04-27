json.extract! game_version, :id, :game_id, :scripts, :templates, :level, :published, :created_at, :updated_at, :published_at
json.package_ids game_version.packages.pluck(:id)
json.url game_version_url(game_version, format: :json)
