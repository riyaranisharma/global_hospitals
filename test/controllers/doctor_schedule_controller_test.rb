require "test_helper"

class DoctorScheduleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get doctor_schedule_index_url
    assert_response :success
  end

  test "should get show" do
    get doctor_schedule_show_url
    assert_response :success
  end

  test "should get new" do
    get doctor_schedule_new_url
    assert_response :success
  end

  test "should get edit" do
    get doctor_schedule_edit_url
    assert_response :success
  end
end
