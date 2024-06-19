# == Schema Information
#
# Table name: game_version_package_versions
#
#  id                 :bigint           not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  game_version_id    :bigint           not null
#  package_version_id :bigint           not null
#
# Indexes
#
#  index_game_version_package_versions_on_game_version_id     (game_version_id)
#  index_game_version_package_versions_on_package_version_id  (package_version_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_version_id => game_versions.id)
#  fk_rails_...  (package_version_id => package_versions.id)
#
class GameVersionPackageVersion < ApplicationRecord
  belongs_to :game_version
  belongs_to :package_version
end
