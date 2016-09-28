require 'test_helper'

class SeccionsControllerTest < ActionController::TestCase
  setup do
    @seccion = seccions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seccions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seccion" do
    assert_difference('Seccion.count') do
      post :create, seccion: { hrsCatedra: @seccion.hrsCatedra, hrsLab: @seccion.hrsLab, modulo_id: @seccion.modulo_id, nombre: @seccion.nombre }
    end

    assert_redirected_to seccion_path(assigns(:seccion))
  end

  test "should show seccion" do
    get :show, id: @seccion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seccion
    assert_response :success
  end

  test "should update seccion" do
    patch :update, id: @seccion, seccion: { hrsCatedra: @seccion.hrsCatedra, hrsLab: @seccion.hrsLab, modulo_id: @seccion.modulo_id, nombre: @seccion.nombre }
    assert_redirected_to seccion_path(assigns(:seccion))
  end

  test "should destroy seccion" do
    assert_difference('Seccion.count', -1) do
      delete :destroy, id: @seccion
    end

    assert_redirected_to seccions_path
  end
end
