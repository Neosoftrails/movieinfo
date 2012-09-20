require 'test_helper'

class BollywoodTrailersControllerTest < ActionController::TestCase
  setup do
    @bollywood_trailer = bollywood_trailers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bollywood_trailers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bollywood_trailer" do
    assert_difference('BollywoodTrailer.count') do
      post :create, bollywood_trailer: { category: @bollywood_trailer.category, data_url: @bollywood_trailer.data_url, description: @bollywood_trailer.description, thumb_url: @bollywood_trailer.thumb_url, title: @bollywood_trailer.title, video_url: @bollywood_trailer.video_url }
    end

    assert_redirected_to bollywood_trailer_path(assigns(:bollywood_trailer))
  end

  test "should show bollywood_trailer" do
    get :show, id: @bollywood_trailer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bollywood_trailer
    assert_response :success
  end

  test "should update bollywood_trailer" do
    put :update, id: @bollywood_trailer, bollywood_trailer: { category: @bollywood_trailer.category, data_url: @bollywood_trailer.data_url, description: @bollywood_trailer.description, thumb_url: @bollywood_trailer.thumb_url, title: @bollywood_trailer.title, video_url: @bollywood_trailer.video_url }
    assert_redirected_to bollywood_trailer_path(assigns(:bollywood_trailer))
  end

  test "should destroy bollywood_trailer" do
    assert_difference('BollywoodTrailer.count', -1) do
      delete :destroy, id: @bollywood_trailer
    end

    assert_redirected_to bollywood_trailers_path
  end
end
