require 'test_helper'

class BollywoodReviewsControllerTest < ActionController::TestCase
  setup do
    @bollywood_review = bollywood_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bollywood_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bollywood_review" do
    assert_difference('BollywoodReview.count') do
      post :create, bollywood_review: { category: @bollywood_review.category, data_url: @bollywood_review.data_url, description: @bollywood_review.description, image_url: @bollywood_review.image_url, mini_description: @bollywood_review.mini_description, rating: @bollywood_review.rating, thumb_url: @bollywood_review.thumb_url, title: @bollywood_review.title }
    end

    assert_redirected_to bollywood_review_path(assigns(:bollywood_review))
  end

  test "should show bollywood_review" do
    get :show, id: @bollywood_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bollywood_review
    assert_response :success
  end

  test "should update bollywood_review" do
    put :update, id: @bollywood_review, bollywood_review: { category: @bollywood_review.category, data_url: @bollywood_review.data_url, description: @bollywood_review.description, image_url: @bollywood_review.image_url, mini_description: @bollywood_review.mini_description, rating: @bollywood_review.rating, thumb_url: @bollywood_review.thumb_url, title: @bollywood_review.title }
    assert_redirected_to bollywood_review_path(assigns(:bollywood_review))
  end

  test "should destroy bollywood_review" do
    assert_difference('BollywoodReview.count', -1) do
      delete :destroy, id: @bollywood_review
    end

    assert_redirected_to bollywood_reviews_path
  end
end
