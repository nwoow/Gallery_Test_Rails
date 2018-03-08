require 'test_helper'

class FoottrafficControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get foottraffic_index_url
    assert_response :success
  end

end
