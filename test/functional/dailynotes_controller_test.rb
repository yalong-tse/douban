require 'test_helper'

class DailynotesControllerTest < ActionController::TestCase
  setup do
    @dailynote = dailynotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dailynotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dailynote" do
    assert_difference('Dailynote.count') do
      post :create, dailynote: { content: @dailynote.content, image: @dailynote.image, link: @dailynote.link, title: @dailynote.title }
    end

    assert_redirected_to dailynote_path(assigns(:dailynote))
  end

  test "should show dailynote" do
    get :show, id: @dailynote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dailynote
    assert_response :success
  end

  test "should update dailynote" do
    put :update, id: @dailynote, dailynote: { content: @dailynote.content, image: @dailynote.image, link: @dailynote.link, title: @dailynote.title }
    assert_redirected_to dailynote_path(assigns(:dailynote))
  end

  test "should destroy dailynote" do
    assert_difference('Dailynote.count', -1) do
      delete :destroy, id: @dailynote
    end

    assert_redirected_to dailynotes_path
  end
end
