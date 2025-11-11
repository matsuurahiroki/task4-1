require "test_helper"

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_schedule_url
    assert_response :success
  end

  test "should get show" do
    # テスト用に1件作る
    schedule = Schedule.create!(title: "Test", start_on: Date.today, end_on: Date.today)
    get schedule_url(schedule)
    assert_response :success
  end

  test "should get edit" do
    schedule = Schedule.create!(title: "Test", start_on: Date.today, end_on: Date.today)
    get edit_schedule_url(schedule)
    assert_response :success
  end
end
