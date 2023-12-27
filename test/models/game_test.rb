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
require "test_helper"

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
