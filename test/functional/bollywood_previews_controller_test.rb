require 'test_helper'

class BollywoodPreviewsControllerTest < ActionController::TestCase
  setup do
    @bollywood_preview = bollywood_previews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bollywood_previews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bollywood_preview" do
    assert_difference('BollywoodPreview.count') do
      post :create, bollywood_preview: { category: @bollywood_preview.category, data_url: @bollywood_preview.data_url, description: @bollywood_preview.description, image_url: @bollywood_preview.image_url, title: @bollywood_preview.title }
    end

    assert_redirected_to bollywood_preview_path(assigns(:bollywood_preview))
  end

  test "should show bollywood_preview" do
    get :show, id: @bollywood_preview
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bollywood_preview
    assert_response :success
  end

  test "should update bollywood_preview" do
    put :update, id: @bollywood_preview, bollywood_preview: { category: @bollywood_preview.category, data_url: @bollywood_preview.data_url, description: @bollywood_preview.description, image_url: @bollywood_preview.image_url, title: @bollywood_preview.title }
    assert_redirected_to bollywood_preview_path(assigns(:bollywood_preview))
  end

  test "should destroy bollywood_preview" do
    assert_difference('BollywoodPreview.count', -1) do
      delete :destroy, id: @bollywood_preview
    end

    assert_redirected_to bollywood_previews_path
  end
end
