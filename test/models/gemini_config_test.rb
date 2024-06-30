# == Schema Information
#
# Table name: gemini_configs
#
#  id             :bigint           not null, primary key
#  maximum_tokens :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "test_helper"

class GeminiConfigTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
