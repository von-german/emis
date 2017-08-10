require 'test_helper'

class TestResultControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get test_result_index_url
    assert_response :success
  end

  test "should get show" do
    get test_result_show_url
    assert_response :success
  end

  test "should get new" do
    get test_result_new_url
    assert_response :success
  end

  test "should get edit" do
    get test_result_edit_url
    assert_response :success
  end

end
