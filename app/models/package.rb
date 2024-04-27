class Package < ApplicationRecord
  belongs_to :user
  has_many :package_versions
  has_many_attached :thumbnails


  def latest_package_version
    package_versions.order(created_at: :desc).first
  end

  def latest_published_package_version
      package_versions.published.order(created_at: :desc).first
  end
end
