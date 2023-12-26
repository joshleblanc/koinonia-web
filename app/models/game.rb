class Game < ApplicationRecord
    has_many :game_versions, dependent: :destroy

    def latest_game_version
        game_versions.order(created_at: :desc).first
    end
end
