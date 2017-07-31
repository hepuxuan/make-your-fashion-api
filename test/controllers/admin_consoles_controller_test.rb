require 'test_helper'

class AdminConsolesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_consoles_index_url
    assert_response :success
  end

end
