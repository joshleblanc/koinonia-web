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
require "test_helper"

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
