require 'test_helper'

class EditionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:editions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create edition" do
    assert_difference('Edition.count') do
      post :create, :edition => { }
    end

    assert_redirected_to edition_path(assigns(:edition))
  end

  test "should show edition" do
    get :show, :id => editions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => editions(:one).to_param
    assert_response :success
  end

  test "should update edition" do
    put :update, :id => editions(:one).to_param, :edition => { }
    assert_redirected_to edition_path(assigns(:edition))
  end

  test "should destroy edition" do
    assert_difference('Edition.count', -1) do
      delete :destroy, :id => editions(:one).to_param
    end

    assert_redirected_to editions_path
  end
end
