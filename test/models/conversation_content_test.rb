# == Schema Information
#
# Table name: conversation_contents
#
#  id              :bigint           not null, primary key
#  role            :string
#  text            :text
#  token_count     :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  conversation_id :bigint           not null
#  next_id         :bigint
#  prev_id         :bigint
#  user_id         :bigint           not null
#
# Indexes
#
#  index_conversation_contents_on_conversation_id  (conversation_id)
#  index_conversation_contents_on_next_id          (next_id)
#  index_conversation_contents_on_prev_id          (prev_id)
#  index_conversation_contents_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (conversation_id => conversations.id)
#  fk_rails_...  (next_id => conversation_contents.id)
#  fk_rails_...  (prev_id => conversation_contents.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class ConversationContentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
