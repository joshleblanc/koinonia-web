require "test_helper"

class GeminiConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gemini_config = gemini_configs(:one)
  end

  test "should get index" do
    get gemini_configs_url
    assert_response :success
  end

  test "should get new" do
    get new_gemini_config_url
    assert_response :success
  end

  test "should create gemini_config" do
    assert_difference("GeminiConfig.count") do
      post gemini_configs_url, params: { gemini_config: {  } }
    end

    assert_redirected_to gemini_config_url(GeminiConfig.last)
  end

  test "should show gemini_config" do
    get gemini_config_url(@gemini_config)
    assert_response :success
  end

  test "should get edit" do
    get edit_gemini_config_url(@gemini_config)
    assert_response :success
  end

  test "should update gemini_config" do
    patch gemini_config_url(@gemini_config), params: { gemini_config: {  } }
    assert_redirected_to gemini_config_url(@gemini_config)
  end

  test "should destroy gemini_config" do
    assert_difference("GeminiConfig.count", -1) do
      delete gemini_config_url(@gemini_config)
    end

    assert_redirected_to gemini_configs_url
  end
end
