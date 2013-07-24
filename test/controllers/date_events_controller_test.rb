require 'test_helper'

class DateEventsControllerTest < ActionController::TestCase
  setup do
    @date_event = date_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:date_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create date_event" do
    assert_difference('DateEvent.count') do
      post :create, date_event: {  }
    end

    assert_redirected_to date_event_path(assigns(:date_event))
  end

  test "should show date_event" do
    get :show, id: @date_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @date_event
    assert_response :success
  end

  test "should update date_event" do
    patch :update, id: @date_event, date_event: {  }
    assert_redirected_to date_event_path(assigns(:date_event))
  end

  test "should destroy date_event" do
    assert_difference('DateEvent.count', -1) do
      delete :destroy, id: @date_event
    end

    assert_redirected_to date_events_path
  end
end
