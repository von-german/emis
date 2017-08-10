require 'test_helper'

class DiagnosesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get diagnoses_new_url
    assert_response :success
  end

  test "should get create" do
    get diagnoses_create_url
    assert_response :success
  end

  test "should get edit" do
    get diagnoses_edit_url
    assert_response :success
  end

  test "should get update" do
    get diagnoses_update_url
    assert_response :success
  end

  test "should get destroy" do
    get diagnoses_destroy_url
    assert_response :success
  end

  test "should get diagnosis_params" do
    get diagnoses_diagnosis_params_url
    assert_response :success
  end

end
