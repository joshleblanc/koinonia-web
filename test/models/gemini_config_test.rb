# == Schema Information
#
# Table name: gemini_configs
#
#  id                  :bigint           not null, primary key
#  maximum_tokens      :integer
#  requests_per_day    :integer          default(1500)
#  requests_per_minute :integer          default(1000000)
#  tokens_per_minute   :integer          default(15)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
require "test_helper"

class GeminiConfigTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
