require "application_system_test_case"

class ConversationContentsTest < ApplicationSystemTestCase
  setup do
    @conversation_content = conversation_contents(:one)
  end

  test "visiting the index" do
    visit conversation_contents_url
    assert_selector "h1", text: "Conversation contents"
  end

  test "should create conversation content" do
    visit conversation_contents_url
    click_on "New conversation content"

    fill_in "Role", with: @conversation_content.role
    fill_in "Text", with: @conversation_content.text
    fill_in "User", with: @conversation_content.user_id
    click_on "Create Conversation content"

    assert_text "Conversation content was successfully created"
    click_on "Back"
  end

  test "should update Conversation content" do
    visit conversation_content_url(@conversation_content)
    click_on "Edit this conversation content", match: :first

    fill_in "Role", with: @conversation_content.role
    fill_in "Text", with: @conversation_content.text
    fill_in "User", with: @conversation_content.user_id
    click_on "Update Conversation content"

    assert_text "Conversation content was successfully updated"
    click_on "Back"
  end

  test "should destroy Conversation content" do
    visit conversation_content_url(@conversation_content)
    click_on "Destroy this conversation content", match: :first

    assert_text "Conversation content was successfully destroyed"
  end
end
