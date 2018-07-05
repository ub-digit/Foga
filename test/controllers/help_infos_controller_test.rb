require 'test_helper'

class HelpInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @help_info = help_infos(:one)
  end

  test "should get index" do
    get help_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_help_info_url
    assert_response :success
  end

  test "should create help_info" do
    assert_difference('HelpInfo.count') do
      post help_infos_url, params: { help_info: { helptext: @help_info.helptext, updated_by: @help_info.updated_by } }
    end

    assert_redirected_to help_info_url(HelpInfo.last)
  end

  test "should show help_info" do
    get help_info_url(@help_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_help_info_url(@help_info)
    assert_response :success
  end

  test "should update help_info" do
    patch help_info_url(@help_info), params: { help_info: { helptext: @help_info.helptext, updated_by: @help_info.updated_by } }
    assert_redirected_to help_info_url(@help_info)
  end

  test "should destroy help_info" do
    assert_difference('HelpInfo.count', -1) do
      delete help_info_url(@help_info)
    end

    assert_redirected_to help_infos_url
  end
end
