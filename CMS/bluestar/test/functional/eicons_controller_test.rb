require 'test_helper'

class EiconsControllerTest < ActionController::TestCase
  setup do
    @eicon = eicons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eicons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eicon" do
    assert_difference('Eicon.count') do
      post :create, eicon: { icon: @eicon.icon, icon_file: @eicon.icon_file, icon_name: @eicon.icon_name }
    end

    assert_redirected_to eicon_path(assigns(:eicon))
  end

  test "should show eicon" do
    get :show, id: @eicon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @eicon
    assert_response :success
  end

  test "should update eicon" do
    put :update, id: @eicon, eicon: { icon: @eicon.icon, icon_file: @eicon.icon_file, icon_name: @eicon.icon_name }
    assert_redirected_to eicon_path(assigns(:eicon))
  end

  test "should destroy eicon" do
    assert_difference('Eicon.count', -1) do
      delete :destroy, id: @eicon
    end

    assert_redirected_to eicons_path
  end
end
