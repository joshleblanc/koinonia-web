# == Schema Information
#
# Table name: games
#
#  id                               :bigint           not null, primary key
#  description                      :text
#  name                             :string
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  latest_game_version_id           :bigint
#  latest_published_game_version_id :bigint
#  user_id                          :bigint           not null
#
# Indexes
#
#  index_games_on_latest_game_version_id            (latest_game_version_id)
#  index_games_on_latest_published_game_version_id  (latest_published_game_version_id)
#  index_games_on_user_id                           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (latest_game_version_id => game_versions.id)
#  fk_rails_...  (latest_published_game_version_id => game_versions.id)
#  fk_rails_...  (user_id => users.id)
#
class Game < ApplicationRecord
  belongs_to :user
  has_many :game_versions, dependent: :destroy
  belongs_to :latest_game_version, class_name: "GameVersion", required: false
  belongs_to :latest_published_game_version, class_name: "GameVersion", required: false

  has_one_attached :cover_image

  before_save :assign_latest

  def assign_latest
    self.latest_game_version = game_versions.order(created_at: :desc).first
    self.latest_published_game_version = game_versions.published.order(created_at: :desc).first
  end

  # def latest_game_version
  #     game_versions.order(created_at: :desc).first
  # end

  # def latest_published_game_version
  #     game_versions.published.order(created_at: :desc).first
  # end
end
