require 'test_helper'

class CandiatesControllerTest < ActionController::TestCase
  setup do
    @candiate = candiates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candiates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candiate" do
    assert_difference('Candiate.count') do
      post :create, candiate: { name: @candiate.name }
    end

    assert_redirected_to candiate_path(assigns(:candiate))
  end

  test "should show candiate" do
    get :show, id: @candiate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @candiate
    assert_response :success
  end

  test "should update candiate" do
    put :update, id: @candiate, candiate: { name: @candiate.name }
    assert_redirected_to candiate_path(assigns(:candiate))
  end

  test "should destroy candiate" do
    assert_difference('Candiate.count', -1) do
      delete :destroy, id: @candiate
    end

    assert_redirected_to candiates_path
  end
end
