json.extract! package, :id, :name, :description, :user_id, :created_at, :updated_at
json.latest_package_version_id package.latest_package_version&.id
json.latest_published_package_version_id package.latest_published_package_version&.id
json.editable current_user == package.user

json.thumbnail_urls do 
    json.array! package.thumbnails do 
        url_for(_1)
    end
end

json.url package_url(package, format: :json)
