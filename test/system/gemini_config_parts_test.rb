require "application_system_test_case"

class GeminiConfigPartsTest < ApplicationSystemTestCase
  setup do
    @gemini_config_part = gemini_config_parts(:one)
  end

  test "visiting the index" do
    visit gemini_config_parts_url
    assert_selector "h1", text: "Gemini config parts"
  end

  test "should create gemini config part" do
    visit gemini_config_parts_url
    click_on "New gemini config part"

    fill_in "Gemini config", with: @gemini_config_part.gemini_config_id
    fill_in "Text", with: @gemini_config_part.text
    click_on "Create Gemini config part"

    assert_text "Gemini config part was successfully created"
    click_on "Back"
  end

  test "should update Gemini config part" do
    visit gemini_config_part_url(@gemini_config_part)
    click_on "Edit this gemini config part", match: :first

    fill_in "Gemini config", with: @gemini_config_part.gemini_config_id
    fill_in "Text", with: @gemini_config_part.text
    click_on "Update Gemini config part"

    assert_text "Gemini config part was successfully updated"
    click_on "Back"
  end

  test "should destroy Gemini config part" do
    visit gemini_config_part_url(@gemini_config_part)
    click_on "Destroy this gemini config part", match: :first

    assert_text "Gemini config part was successfully destroyed"
  end
end
