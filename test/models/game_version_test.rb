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
require "test_helper"

class GameVersionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
