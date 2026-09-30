require "test_helper"

class PatientProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get patient_profiles_index_url
    assert_response :success
  end

  test "should get show" do
    get patient_profiles_show_url
    assert_response :success
  end

  test "should get new" do
    get patient_profiles_new_url
    assert_response :success
  end

  test "should get edit" do
    get patient_profiles_edit_url
    assert_response :success
  end
end
