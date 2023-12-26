require "application_system_test_case"

class GameVersionsTest < ApplicationSystemTestCase
  setup do
    @game_version = game_versions(:one)
  end

  test "visiting the index" do
    visit game_versions_url
    assert_selector "h1", text: "Game versions"
  end

  test "should create game version" do
    visit game_versions_url
    click_on "New game version"

    fill_in "Game", with: @game_version.game_id
    fill_in "Level", with: @game_version.level
    fill_in "Scripts", with: @game_version.scripts
    click_on "Create Game version"

    assert_text "Game version was successfully created"
    click_on "Back"
  end

  test "should update Game version" do
    visit game_version_url(@game_version)
    click_on "Edit this game version", match: :first

    fill_in "Game", with: @game_version.game_id
    fill_in "Level", with: @game_version.level
    fill_in "Scripts", with: @game_version.scripts
    click_on "Update Game version"

    assert_text "Game version was successfully updated"
    click_on "Back"
  end

  test "should destroy Game version" do
    visit game_version_url(@game_version)
    click_on "Destroy this game version", match: :first

    assert_text "Game version was successfully destroyed"
  end
end
