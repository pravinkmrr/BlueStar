require 'test_helper'

class KeynotesControllerTest < ActionController::TestCase
  setup do
    @keynote = keynotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:keynotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create keynote" do
    assert_difference('Keynote.count') do
      post :create, keynote: { filename: @keynote.filename, name: @keynote.name, pdf: @keynote.pdf, type: @keynote.type }
    end

    assert_redirected_to keynote_path(assigns(:keynote))
  end

  test "should show keynote" do
    get :show, id: @keynote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @keynote
    assert_response :success
  end

  test "should update keynote" do
    put :update, id: @keynote, keynote: { filename: @keynote.filename, name: @keynote.name, pdf: @keynote.pdf, type: @keynote.type }
    assert_redirected_to keynote_path(assigns(:keynote))
  end

  test "should destroy keynote" do
    assert_difference('Keynote.count', -1) do
      delete :destroy, id: @keynote
    end

    assert_redirected_to keynotes_path
  end
end
