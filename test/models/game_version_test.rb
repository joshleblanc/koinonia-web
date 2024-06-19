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
require "test_helper"

class GameVersionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
