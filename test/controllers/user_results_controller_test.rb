require 'test_helper'

class UserResultsControllerTest < ActionController::TestCase
  setup do
    @user_result = user_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_result" do
    assert_difference('UserResult.count') do
      post :create, user_result: { points: @user_result.points }
    end

    assert_redirected_to user_result_path(assigns(:user_result))
  end

  test "should show user_result" do
    get :show, id: @user_result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_result
    assert_response :success
  end

  test "should update user_result" do
    patch :update, id: @user_result, user_result: { points: @user_result.points }
    assert_redirected_to user_result_path(assigns(:user_result))
  end

  test "should destroy user_result" do
    assert_difference('UserResult.count', -1) do
      delete :destroy, id: @user_result
    end

    assert_redirected_to user_results_path
  end
end
