require "application_system_test_case"

class PackageVersionsTest < ApplicationSystemTestCase
  setup do
    @package_version = package_versions(:one)
  end

  test "visiting the index" do
    visit package_versions_url
    assert_selector "h1", text: "Package versions"
  end

  test "should create package version" do
    visit package_versions_url
    click_on "New package version"

    fill_in "Levels", with: @package_version.levels
    fill_in "Package", with: @package_version.package_id
    fill_in "Scripts", with: @package_version.scripts
    fill_in "Templates", with: @package_version.templates
    click_on "Create Package version"

    assert_text "Package version was successfully created"
    click_on "Back"
  end

  test "should update Package version" do
    visit package_version_url(@package_version)
    click_on "Edit this package version", match: :first

    fill_in "Levels", with: @package_version.levels
    fill_in "Package", with: @package_version.package_id
    fill_in "Scripts", with: @package_version.scripts
    fill_in "Templates", with: @package_version.templates
    click_on "Update Package version"

    assert_text "Package version was successfully updated"
    click_on "Back"
  end

  test "should destroy Package version" do
    visit package_version_url(@package_version)
    click_on "Destroy this package version", match: :first

    assert_text "Package version was successfully destroyed"
  end
end
