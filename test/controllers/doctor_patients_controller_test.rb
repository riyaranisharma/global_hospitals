require "test_helper"

class DoctorPatientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get doctor_patients_index_url
    assert_response :success
  end

  test "should get show" do
    get doctor_patients_show_url
    assert_response :success
  end

  test "should get new" do
    get doctor_patients_new_url
    assert_response :success
  end

  test "should get edit" do
    get doctor_patients_edit_url
    assert_response :success
  end
end
