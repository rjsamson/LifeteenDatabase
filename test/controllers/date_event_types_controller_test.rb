require 'test_helper'

class DateEventTypesControllerTest < ActionController::TestCase
  setup do
    @date_event_type = date_event_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:date_event_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create date_event_type" do
    assert_difference('DateEventType.count') do
      post :create, date_event_type: {  }
    end

    assert_redirected_to date_event_type_path(assigns(:date_event_type))
  end

  test "should show date_event_type" do
    get :show, id: @date_event_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @date_event_type
    assert_response :success
  end

  test "should update date_event_type" do
    patch :update, id: @date_event_type, date_event_type: {  }
    assert_redirected_to date_event_type_path(assigns(:date_event_type))
  end

  test "should destroy date_event_type" do
    assert_difference('DateEventType.count', -1) do
      delete :destroy, id: @date_event_type
    end

    assert_redirected_to date_event_types_path
  end
end
