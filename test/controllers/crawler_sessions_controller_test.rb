require 'test_helper'

class CrawlerSessionsControllerTest < ActionController::TestCase
  setup do
    @crawler_session = crawler_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crawler_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crawler_session" do
    assert_difference('CrawlerSession.count') do
      post :create, crawler_session: { end_time: @crawler_session.end_time, start_time: @crawler_session.start_time }
    end

    assert_redirected_to crawler_session_path(assigns(:crawler_session))
  end

  test "should show crawler_session" do
    get :show, id: @crawler_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @crawler_session
    assert_response :success
  end

  test "should update crawler_session" do
    patch :update, id: @crawler_session, crawler_session: { end_time: @crawler_session.end_time, start_time: @crawler_session.start_time }
    assert_redirected_to crawler_session_path(assigns(:crawler_session))
  end

  test "should destroy crawler_session" do
    assert_difference('CrawlerSession.count', -1) do
      delete :destroy, id: @crawler_session
    end

    assert_redirected_to crawler_sessions_path
  end
end
