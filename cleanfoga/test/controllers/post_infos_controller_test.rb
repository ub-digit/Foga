require 'test_helper'

class PostInfosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get post_infos_index_url
    assert_response :success
  end

end
