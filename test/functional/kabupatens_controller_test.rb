require 'test_helper'

class KabupatensControllerTest < ActionController::TestCase
  setup do
    @kabupaten = kabupatens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kabupatens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kabupaten" do
    assert_difference('Kabupaten.count') do
      post :create, kabupaten: @kabupaten.attributes
    end

    assert_redirected_to kabupaten_path(assigns(:kabupaten))
  end

  test "should show kabupaten" do
    get :show, id: @kabupaten.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kabupaten.to_param
    assert_response :success
  end

  test "should update kabupaten" do
    put :update, id: @kabupaten.to_param, kabupaten: @kabupaten.attributes
    assert_redirected_to kabupaten_path(assigns(:kabupaten))
  end

  test "should destroy kabupaten" do
    assert_difference('Kabupaten.count', -1) do
      delete :destroy, id: @kabupaten.to_param
    end

    assert_redirected_to kabupatens_path
  end
end
