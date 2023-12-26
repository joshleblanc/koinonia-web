require "test_helper"

class GameVersionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_version = game_versions(:one)
  end

  test "should get index" do
    get game_versions_url
    assert_response :success
  end

  test "should get new" do
    get new_game_version_url
    assert_response :success
  end

  test "should create game_version" do
    assert_difference("GameVersion.count") do
      post game_versions_url, params: { game_version: { game_id: @game_version.game_id, level: @game_version.level, scripts: @game_version.scripts } }
    end

    assert_redirected_to game_version_url(GameVersion.last)
  end

  test "should show game_version" do
    get game_version_url(@game_version)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_version_url(@game_version)
    assert_response :success
  end

  test "should update game_version" do
    patch game_version_url(@game_version), params: { game_version: { game_id: @game_version.game_id, level: @game_version.level, scripts: @game_version.scripts } }
    assert_redirected_to game_version_url(@game_version)
  end

  test "should destroy game_version" do
    assert_difference("GameVersion.count", -1) do
      delete game_version_url(@game_version)
    end

    assert_redirected_to game_versions_url
  end
end
