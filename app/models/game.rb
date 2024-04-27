# == Schema Information
#
# Table name: games
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
class Game < ApplicationRecord
    belongs_to :user
    has_many :game_versions, dependent: :destroy

    has_one_attached :cover_image

    def latest_game_version
        game_versions.order(created_at: :desc).first
    end

    def latest_published_game_version
        game_versions.published.order(created_at: :desc).first
    end
end
