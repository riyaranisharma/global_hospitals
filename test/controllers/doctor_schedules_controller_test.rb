require "test_helper"

class DoctorSchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get doctor_schedules_index_url
    assert_response :success
  end

  test "should get new" do
    get doctor_schedules_new_url
    assert_response :success
  end

  test "should get edit" do
    get doctor_schedules_edit_url
    assert_response :success
  end
end
