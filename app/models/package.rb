# == Schema Information
#
# Table name: packages
#
#  id                                  :bigint           not null, primary key
#  description                         :text
#  name                                :string
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#  latest_package_version_id           :bigint
#  latest_published_package_version_id :bigint
#  user_id                             :bigint           not null
#
# Indexes
#
#  index_packages_on_latest_package_version_id            (latest_package_version_id)
#  index_packages_on_latest_published_package_version_id  (latest_published_package_version_id)
#  index_packages_on_user_id                              (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (latest_package_version_id => package_versions.id)
#  fk_rails_...  (latest_published_package_version_id => package_versions.id)
#  fk_rails_...  (user_id => users.id)
#
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
