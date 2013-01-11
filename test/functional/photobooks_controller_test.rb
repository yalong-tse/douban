require 'test_helper'

class PhotobooksControllerTest < ActionController::TestCase
  setup do
    @photobook = photobooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photobooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photobook" do
    assert_difference('Photobook.count') do
      post :create, photobook: { description: @photobook.description, name: @photobook.name, preface: @photobook.preface }
    end

    assert_redirected_to photobook_path(assigns(:photobook))
  end

  test "should show photobook" do
    get :show, id: @photobook
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photobook
    assert_response :success
  end

  test "should update photobook" do
    put :update, id: @photobook, photobook: { description: @photobook.description, name: @photobook.name, preface: @photobook.preface }
    assert_redirected_to photobook_path(assigns(:photobook))
  end

  test "should destroy photobook" do
    assert_difference('Photobook.count', -1) do
      delete :destroy, id: @photobook
    end

    assert_redirected_to photobooks_path
  end
end
