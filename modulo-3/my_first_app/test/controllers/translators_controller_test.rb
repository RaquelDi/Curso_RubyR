require 'test_helper'

class TranslatorsControllerTest < ActionController::TestCase
  test "should get translate" do
    get :translate
    assert_response :success
  end

  test "should get detect" do
    get :detect
    assert_response :success
  end

  test "should get languages" do
    get :languages
    assert_response :success
  end

end
