class PackageVersion < ApplicationRecord
  belongs_to :package

  has_many :game_version_package_versions
  has_many :game_versions, through: :game_version_package_versions

  scope :published, -> { where(published: true) }
end
