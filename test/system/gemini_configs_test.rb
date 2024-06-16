require "application_system_test_case"

class GeminiConfigsTest < ApplicationSystemTestCase
  setup do
    @gemini_config = gemini_configs(:one)
  end

  test "visiting the index" do
    visit gemini_configs_url
    assert_selector "h1", text: "Gemini configs"
  end

  test "should create gemini config" do
    visit gemini_configs_url
    click_on "New gemini config"

    click_on "Create Gemini config"

    assert_text "Gemini config was successfully created"
    click_on "Back"
  end

  test "should update Gemini config" do
    visit gemini_config_url(@gemini_config)
    click_on "Edit this gemini config", match: :first

    click_on "Update Gemini config"

    assert_text "Gemini config was successfully updated"
    click_on "Back"
  end

  test "should destroy Gemini config" do
    visit gemini_config_url(@gemini_config)
    click_on "Destroy this gemini config", match: :first

    assert_text "Gemini config was successfully destroyed"
  end
end
