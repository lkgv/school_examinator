require "application_system_test_case"

class ExamItemsTest < ApplicationSystemTestCase
  setup do
    @exam_item = exam_items(:one)
  end

  test "visiting the index" do
    visit exam_items_url
    assert_selector "h1", text: "Exam Items"
  end

  test "creating a Exam item" do
    visit exam_items_url
    click_on "New Exam Item"

    fill_in "Name", with: @exam_item.name
    click_on "Create Exam item"

    assert_text "Exam item was successfully created"
    click_on "Back"
  end

  test "updating a Exam item" do
    visit exam_items_url
    click_on "Edit", match: :first

    fill_in "Name", with: @exam_item.name
    click_on "Update Exam item"

    assert_text "Exam item was successfully updated"
    click_on "Back"
  end

  test "destroying a Exam item" do
    visit exam_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exam item was successfully destroyed"
  end
end
