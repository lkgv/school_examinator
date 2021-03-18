require "application_system_test_case"

class StdActivitiesTest < ApplicationSystemTestCase
  setup do
    @std_activity = std_activities(:one)
  end

  test "visiting the index" do
    visit std_activities_url
    assert_selector "h1", text: "Std Activities"
  end

  test "creating a Std activity" do
    visit std_activities_url
    click_on "New Std Activity"

    fill_in "Description", with: @std_activity.description
    fill_in "Score", with: @std_activity.score
    click_on "Create Std activity"

    assert_text "Std activity was successfully created"
    click_on "Back"
  end

  test "updating a Std activity" do
    visit std_activities_url
    click_on "Edit", match: :first

    fill_in "Description", with: @std_activity.description
    fill_in "Score", with: @std_activity.score
    click_on "Update Std activity"

    assert_text "Std activity was successfully updated"
    click_on "Back"
  end

  test "destroying a Std activity" do
    visit std_activities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Std activity was successfully destroyed"
  end
end
