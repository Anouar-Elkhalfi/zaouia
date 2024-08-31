require "test_helper"

class Admin::MedicalCaresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_medical_cares_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_medical_cares_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_medical_cares_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_medical_cares_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_medical_cares_destroy_url
    assert_response :success
  end
end
