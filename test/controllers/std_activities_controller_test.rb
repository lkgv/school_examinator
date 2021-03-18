require "test_helper"

class StdActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @std_activity = std_activities(:one)
  end

  test "should get index" do
    get std_activities_url
    assert_response :success
  end

  test "should get new" do
    get new_std_activity_url
    assert_response :success
  end

  test "should create std_activity" do
    assert_difference('StdActivity.count') do
      post std_activities_url, params: { std_activity: { description: @std_activity.description, score: @std_activity.score } }
    end

    assert_redirected_to std_activity_url(StdActivity.last)
  end

  test "should show std_activity" do
    get std_activity_url(@std_activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_std_activity_url(@std_activity)
    assert_response :success
  end

  test "should update std_activity" do
    patch std_activity_url(@std_activity), params: { std_activity: { description: @std_activity.description, score: @std_activity.score } }
    assert_redirected_to std_activity_url(@std_activity)
  end

  test "should destroy std_activity" do
    assert_difference('StdActivity.count', -1) do
      delete std_activity_url(@std_activity)
    end

    assert_redirected_to std_activities_url
  end
end
