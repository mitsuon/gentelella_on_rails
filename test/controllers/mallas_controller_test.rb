require 'test_helper'

class MallasControllerTest < ActionController::TestCase
  setup do
    @malla = mallas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mallas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create malla" do
    assert_difference('Malla.count') do
      post :create, malla: { plan: @malla.plan }
    end

    assert_redirected_to malla_path(assigns(:malla))
  end

  test "should show malla" do
    get :show, id: @malla
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @malla
    assert_response :success
  end

  test "should update malla" do
    patch :update, id: @malla, malla: { plan: @malla.plan }
    assert_redirected_to malla_path(assigns(:malla))
  end

  test "should destroy malla" do
    assert_difference('Malla.count', -1) do
      delete :destroy, id: @malla
    end

    assert_redirected_to mallas_path
  end
end
