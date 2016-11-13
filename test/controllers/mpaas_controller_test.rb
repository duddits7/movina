require 'test_helper'

class MpaasControllerTest < ActionController::TestCase
  setup do
    @mpaa = mpaas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mpaas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mpaa" do
    assert_difference('Mpaa.count') do
      post :create, mpaa: { name: @mpaa.name }
    end

    assert_redirected_to mpaa_path(assigns(:mpaa))
  end

  test "should show mpaa" do
    get :show, id: @mpaa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mpaa
    assert_response :success
  end

  test "should update mpaa" do
    patch :update, id: @mpaa, mpaa: { name: @mpaa.name }
    assert_redirected_to mpaa_path(assigns(:mpaa))
  end

  test "should destroy mpaa" do
    assert_difference('Mpaa.count', -1) do
      delete :destroy, id: @mpaa
    end

    assert_redirected_to mpaas_path
  end
end
