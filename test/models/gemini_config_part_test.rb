# == Schema Information
#
# Table name: gemini_config_parts
#
#  id               :bigint           not null, primary key
#  text             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  gemini_config_id :bigint           not null
#
# Indexes
#
#  index_gemini_config_parts_on_gemini_config_id  (gemini_config_id)
#
# Foreign Keys
#
#  fk_rails_...  (gemini_config_id => gemini_configs.id)
#
require "test_helper"

class GeminiConfigPartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
