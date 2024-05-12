class Package < ApplicationRecord
  belongs_to :user
  has_many :package_versions
  has_many_attached :thumbnails

  belongs_to :latest_package_version, class_name: "PackageVersion", required: false
  belongs_to :latest_published_package_version, class_name: "PackageVersion", required: false

  before_save :assign_latest

  def assign_latest
      self.latest_package_version = package_versions.order(created_at: :desc).first
      self.latest_published_package_version = package_versions.published.order(created_at: :desc).first
  end
end
