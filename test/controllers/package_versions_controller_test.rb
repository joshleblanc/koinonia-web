require "test_helper"

class PackageVersionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @package_version = package_versions(:one)
  end

  test "should get index" do
    get package_versions_url
    assert_response :success
  end

  test "should get new" do
    get new_package_version_url
    assert_response :success
  end

  test "should create package_version" do
    assert_difference("PackageVersion.count") do
      post package_versions_url, params: { package_version: { levels: @package_version.levels, package_id: @package_version.package_id, scripts: @package_version.scripts, templates: @package_version.templates } }
    end

    assert_redirected_to package_version_url(PackageVersion.last)
  end

  test "should show package_version" do
    get package_version_url(@package_version)
    assert_response :success
  end

  test "should get edit" do
    get edit_package_version_url(@package_version)
    assert_response :success
  end

  test "should update package_version" do
    patch package_version_url(@package_version), params: { package_version: { levels: @package_version.levels, package_id: @package_version.package_id, scripts: @package_version.scripts, templates: @package_version.templates } }
    assert_redirected_to package_version_url(@package_version)
  end

  test "should destroy package_version" do
    assert_difference("PackageVersion.count", -1) do
      delete package_version_url(@package_version)
    end

    assert_redirected_to package_versions_url
  end
end
