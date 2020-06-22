require 'test_helper'

class TagControllerTest < ActionDispatch::IntegrationTest
  test "should get tag" do
    get tag_tag_url
    assert_response :success
  end

end
