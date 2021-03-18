require "test_helper"

class ExamItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exam_item = exam_items(:one)
  end

  test "should get index" do
    get exam_items_url
    assert_response :success
  end

  test "should get new" do
    get new_exam_item_url
    assert_response :success
  end

  test "should create exam_item" do
    assert_difference('ExamItem.count') do
      post exam_items_url, params: { exam_item: { name: @exam_item.name } }
    end

    assert_redirected_to exam_item_url(ExamItem.last)
  end

  test "should show exam_item" do
    get exam_item_url(@exam_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_exam_item_url(@exam_item)
    assert_response :success
  end

  test "should update exam_item" do
    patch exam_item_url(@exam_item), params: { exam_item: { name: @exam_item.name } }
    assert_redirected_to exam_item_url(@exam_item)
  end

  test "should destroy exam_item" do
    assert_difference('ExamItem.count', -1) do
      delete exam_item_url(@exam_item)
    end

    assert_redirected_to exam_items_url
  end
end
