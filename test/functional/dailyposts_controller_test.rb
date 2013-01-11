require 'test_helper'

class DailypostsControllerTest < ActionController::TestCase
  setup do
    @dailypost = dailyposts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dailyposts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dailypost" do
    assert_difference('Dailypost.count') do
      post :create, dailypost: { content: @dailypost.content, dailynote_id: @dailypost.dailynote_id, image: @dailypost.image }
    end

    assert_redirected_to dailypost_path(assigns(:dailypost))
  end

  test "should show dailypost" do
    get :show, id: @dailypost
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dailypost
    assert_response :success
  end

  test "should update dailypost" do
    put :update, id: @dailypost, dailypost: { content: @dailypost.content, dailynote_id: @dailypost.dailynote_id, image: @dailypost.image }
    assert_redirected_to dailypost_path(assigns(:dailypost))
  end

  test "should destroy dailypost" do
    assert_difference('Dailypost.count', -1) do
      delete :destroy, id: @dailypost
    end

    assert_redirected_to dailyposts_path
  end
end
