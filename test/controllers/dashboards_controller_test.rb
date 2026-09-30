require "test_helper"

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get patient" do
    get dashboards_patient_url
    assert_response :success
  end
end
