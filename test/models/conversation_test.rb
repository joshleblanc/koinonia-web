# == Schema Information
#
# Table name: conversations
#
#  id                   :bigint           not null, primary key
#  send_baseline_prompt :boolean          default(TRUE)
#  send_documentation   :boolean          default(TRUE)
#  send_project_code    :boolean          default(TRUE)
#  title                :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :bigint           not null
#
# Indexes
#
#  index_conversations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class ConversationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
