require 'test_helper'

class EncryptControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get encode" do
    get :encode
    assert_response :success
  end

  test "should get decode" do
    get :decode
    assert_response :success
  end

  test "should get crack" do
    get :crack
    assert_response :success
  end

end
