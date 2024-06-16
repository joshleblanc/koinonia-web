require "test_helper"

class GeminiConfigPartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gemini_config_part = gemini_config_parts(:one)
  end

  test "should get index" do
    get gemini_config_parts_url
    assert_response :success
  end

  test "should get new" do
    get new_gemini_config_part_url
    assert_response :success
  end

  test "should create gemini_config_part" do
    assert_difference("GeminiConfigPart.count") do
      post gemini_config_parts_url, params: { gemini_config_part: { gemini_config_id: @gemini_config_part.gemini_config_id, text: @gemini_config_part.text } }
    end

    assert_redirected_to gemini_config_part_url(GeminiConfigPart.last)
  end

  test "should show gemini_config_part" do
    get gemini_config_part_url(@gemini_config_part)
    assert_response :success
  end

  test "should get edit" do
    get edit_gemini_config_part_url(@gemini_config_part)
    assert_response :success
  end

  test "should update gemini_config_part" do
    patch gemini_config_part_url(@gemini_config_part), params: { gemini_config_part: { gemini_config_id: @gemini_config_part.gemini_config_id, text: @gemini_config_part.text } }
    assert_redirected_to gemini_config_part_url(@gemini_config_part)
  end

  test "should destroy gemini_config_part" do
    assert_difference("GeminiConfigPart.count", -1) do
      delete gemini_config_part_url(@gemini_config_part)
    end

    assert_redirected_to gemini_config_parts_url
  end
end
