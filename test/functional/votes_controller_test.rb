require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  setup do
    @vote = votes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:votes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vote" do
    assert_difference('Vote.count') do
      post :create, vote: { song_id: @vote.song_id, station_id: @vote.station_id, user_id: @vote.user_id, vote_time: @vote.vote_time }
    end

    assert_redirected_to vote_path(assigns(:vote))
  end

  test "should show vote" do
    get :show, id: @vote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vote
    assert_response :success
  end

  test "should update vote" do
    put :update, id: @vote, vote: { song_id: @vote.song_id, station_id: @vote.station_id, user_id: @vote.user_id, vote_time: @vote.vote_time }
    assert_redirected_to vote_path(assigns(:vote))
  end

  test "should destroy vote" do
    assert_difference('Vote.count', -1) do
      delete :destroy, id: @vote
    end

    assert_redirected_to votes_path
  end
end
