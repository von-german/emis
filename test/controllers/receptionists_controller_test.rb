require 'test_helper'

class ReceptionistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @receptionist = receptionists(:one)
  end

  test "should get index" do
    get receptionists_url
    assert_response :success
  end

  test "should get new" do
    get new_receptionist_url
    assert_response :success
  end

  test "should create receptionist" do
    assert_difference('Receptionist.count') do
      post receptionists_url, params: { receptionist: {  } }
    end

    assert_redirected_to receptionist_url(Receptionist.last)
  end

  test "should show receptionist" do
    get receptionist_url(@receptionist)
    assert_response :success
  end

  test "should get edit" do
    get edit_receptionist_url(@receptionist)
    assert_response :success
  end

  test "should update receptionist" do
    patch receptionist_url(@receptionist), params: { receptionist: {  } }
    assert_redirected_to receptionist_url(@receptionist)
  end

  test "should destroy receptionist" do
    assert_difference('Receptionist.count', -1) do
      delete receptionist_url(@receptionist)
    end

    assert_redirected_to receptionists_url
  end
end
