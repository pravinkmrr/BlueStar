require 'test_helper'

class BlobsControllerTest < ActionController::TestCase
  setup do
    @blob = blobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blob" do
    assert_difference('Blob.count') do
      post :create, blob: { content_type: @blob.content_type, file: @blob.file, filename: @blob.filename }
    end

    assert_redirected_to blob_path(assigns(:blob))
  end

  test "should show blob" do
    get :show, id: @blob
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blob
    assert_response :success
  end

  test "should update blob" do
    put :update, id: @blob, blob: { content_type: @blob.content_type, file: @blob.file, filename: @blob.filename }
    assert_redirected_to blob_path(assigns(:blob))
  end

  test "should destroy blob" do
    assert_difference('Blob.count', -1) do
      delete :destroy, id: @blob
    end

    assert_redirected_to blobs_path
  end
end
