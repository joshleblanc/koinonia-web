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
end
