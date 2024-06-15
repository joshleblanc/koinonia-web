require "test_helper"

class ConversationContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conversation_content = conversation_contents(:one)
  end

  test "should get index" do
    get conversation_contents_url
    assert_response :success
  end

  test "should get new" do
    get new_conversation_content_url
    assert_response :success
  end

  test "should create conversation_content" do
    assert_difference("ConversationContent.count") do
      post conversation_contents_url, params: { conversation_content: { role: @conversation_content.role, text: @conversation_content.text, user_id: @conversation_content.user_id } }
    end

    assert_redirected_to conversation_content_url(ConversationContent.last)
  end

  test "should show conversation_content" do
    get conversation_content_url(@conversation_content)
    assert_response :success
  end

  test "should get edit" do
    get edit_conversation_content_url(@conversation_content)
    assert_response :success
  end

  test "should update conversation_content" do
    patch conversation_content_url(@conversation_content), params: { conversation_content: { role: @conversation_content.role, text: @conversation_content.text, user_id: @conversation_content.user_id } }
    assert_redirected_to conversation_content_url(@conversation_content)
  end

  test "should destroy conversation_content" do
    assert_difference("ConversationContent.count", -1) do
      delete conversation_content_url(@conversation_content)
    end

    assert_redirected_to conversation_contents_url
  end
end
