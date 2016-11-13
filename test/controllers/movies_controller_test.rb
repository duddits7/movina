require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  setup do
    @movie = movies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movie" do
    assert_difference('Movie.count') do
      post :create, movie: { title: @movie.title, approved: @movie.approved, mpaa_id: @movie.mpaa_id, description: @movie.description, title_original: @movie.title_original, post_date: @movie.post_date, prod_date: @movie.prod_date }
    end

    assert_redirected_to movie_path(assigns(:movie))
  end

  test "should show movie" do
    get :show, id: @movie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movie
    assert_response :success
  end

  test "should update movie" do
    patch :update, id: @movie, movie: { title: @movie.title, approved: @movie.approved, mpaa_id: @movie.mpaa_id, description: @movie.description, title_original: @movie.title_original, post_date: @movie.post_date, prod_date: @movie.prod_date }
    assert_redirected_to movie_path(assigns(:movie))
  end

  test "should destroy movie" do
    assert_difference('Movie.count', -1) do
      delete :destroy, id: @movie
    end

    assert_redirected_to movies_path
  end
end
