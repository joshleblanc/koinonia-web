# == Schema Information
#
# Table name: game_versions
#
#  id           :bigint           not null, primary key
#  level        :json
#  published    :boolean          default(FALSE)
#  published_at :datetime
#  scripts      :json
#  templates    :json
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  game_id      :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_game_versions_on_game_id  (game_id)
#  index_game_versions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id)
#  fk_rails_...  (user_id => users.id)
#
class GameVersion < ApplicationRecord
  belongs_to :user
  belongs_to :game, touch: true

  has_many :game_version_package_versions, dependent: :destroy
  has_many :package_versions, through: :game_version_package_versions
  has_many :packages, through: :package_versions

  before_save :set_published_at, if: :published_changed?
  after_save { game.assign_latest! }

  scope :published, -> { where(published: true) }

  def set_published_at
    self.published_at = if published?
        Time.now
      else
        nil
      end
  end
end
