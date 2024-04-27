# == Schema Information
#
# Table name: game_versions
#
#  id         :bigint           not null, primary key
#  game_id    :bigint           not null
#  scripts    :json
#  level      :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
class GameVersion < ApplicationRecord
  belongs_to :user
  belongs_to :game

  has_many :game_version_package_versions
  has_many :package_versions, through: :game_version_package_versions
  has_many :packages, through: :package_versions

  before_save :set_published_at, if: :published_changed?

  scope :published, -> { where(published: true) }

  def set_published_at
    self.published_at = if published?
                          Time.now
                        else
                          nil
                        end
  end
end
