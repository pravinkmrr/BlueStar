require 'test_helper'

class IconsControllerTest < ActionController::TestCase
  setup do
    @icon = icons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:icons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create icon" do
    assert_difference('Icon.count') do
      post :create, icon: { icon_id: @icon.icon_id }
    end

    assert_redirected_to icon_path(assigns(:icon))
  end

  test "should show icon" do
    get :show, id: @icon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @icon
    assert_response :success
  end

  test "should update icon" do
    put :update, id: @icon, icon: { icon_id: @icon.icon_id }
    assert_redirected_to icon_path(assigns(:icon))
  end

  test "should destroy icon" do
    assert_difference('Icon.count', -1) do
      delete :destroy, id: @icon
    end

    assert_redirected_to icons_path
  end
end
