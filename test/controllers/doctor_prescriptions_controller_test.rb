require "test_helper"

class DoctorPrescriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get doctor_prescriptions_index_url
    assert_response :success
  end

  test "should get new" do
    get doctor_prescriptions_new_url
    assert_response :success
  end

  test "should get create" do
    get doctor_prescriptions_create_url
    assert_response :success
  end

  test "should get show" do
    get doctor_prescriptions_show_url
    assert_response :success
  end
end
