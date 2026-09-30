require "test_helper"

class DoctorAppointmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get doctor_appointments_index_url
    assert_response :success
  end

  test "should get show" do
    get doctor_appointments_show_url
    assert_response :success
  end

  test "should get new" do
    get doctor_appointments_new_url
    assert_response :success
  end

  test "should get edit" do
    get doctor_appointments_edit_url
    assert_response :success
  end
end
