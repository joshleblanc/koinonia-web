# == Schema Information
#
# Table name: package_versions
#
#  id         :bigint           not null, primary key
#  levels     :json
#  published  :boolean          default(FALSE)
#  scripts    :json
#  templates  :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  package_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_package_versions_on_package_id  (package_id)
#  index_package_versions_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (package_id => packages.id)
#  fk_rails_...  (user_id => users.id)
#
class PackageVersion < ApplicationRecord
  include Pathable 
  
  belongs_to :package
  belongs_to :user

  has_many :game_version_package_versions
  has_many :game_versions, through: :game_version_package_versions

  scope :published, -> { where(published: true) }
end
