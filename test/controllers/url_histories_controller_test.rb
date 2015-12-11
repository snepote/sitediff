require 'test_helper'

class UrlHistoriesControllerTest < ActionController::TestCase
  setup do
    @url_history = url_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:url_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create url_history" do
    assert_difference('UrlHistory.count') do
      post :create, url_history: { crawler_session_id: @url_history.crawler_session_id, diff_to_previous: @url_history.diff_to_previous, screenshot_id: @url_history.screenshot_id, url_id: @url_history.url_id }
    end

    assert_redirected_to url_history_path(assigns(:url_history))
  end

  test "should show url_history" do
    get :show, id: @url_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @url_history
    assert_response :success
  end

  test "should update url_history" do
    patch :update, id: @url_history, url_history: { crawler_session_id: @url_history.crawler_session_id, diff_to_previous: @url_history.diff_to_previous, screenshot_id: @url_history.screenshot_id, url_id: @url_history.url_id }
    assert_redirected_to url_history_path(assigns(:url_history))
  end

  test "should destroy url_history" do
    assert_difference('UrlHistory.count', -1) do
      delete :destroy, id: @url_history
    end

    assert_redirected_to url_histories_path
  end
end
