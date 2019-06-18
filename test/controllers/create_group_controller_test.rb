require 'test_helper'

class CreateGroupControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get create_group_new_url
    assert_response :success
  end

end
