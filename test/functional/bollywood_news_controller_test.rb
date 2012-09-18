require 'test_helper'

class BollywoodNewsControllerTest < ActionController::TestCase
  setup do
    @bollywood_news = bollywood_news(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bollywood_news)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bollywood_news" do
    assert_difference('BollywoodNews.count') do
      post :create, bollywood_news: { category: @bollywood_news.category, data_url: @bollywood_news.data_url, description: @bollywood_news.description, image_url: @bollywood_news.image_url, title: @bollywood_news.title }
    end

    assert_redirected_to bollywood_news_path(assigns(:bollywood_news))
  end

  test "should show bollywood_news" do
    get :show, id: @bollywood_news
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bollywood_news
    assert_response :success
  end

  test "should update bollywood_news" do
    put :update, id: @bollywood_news, bollywood_news: { category: @bollywood_news.category, data_url: @bollywood_news.data_url, description: @bollywood_news.description, image_url: @bollywood_news.image_url, title: @bollywood_news.title }
    assert_redirected_to bollywood_news_path(assigns(:bollywood_news))
  end

  test "should destroy bollywood_news" do
    assert_difference('BollywoodNews.count', -1) do
      delete :destroy, id: @bollywood_news
    end

    assert_redirected_to bollywood_news_index_path
  end
end
