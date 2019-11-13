require 'test_helper'

class BasicpagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get basicpages_home_url
    assert_response :success
  end

  test "should get help" do
    get basicpages_help_url
    assert_response :success
  end

end
