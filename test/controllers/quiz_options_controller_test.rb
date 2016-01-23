require 'test_helper'

class QuizOptionsControllerTest < ActionController::TestCase
  setup do
    @quiz_option = quiz_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quiz_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quiz_option" do
    assert_difference('QuizOption.count') do
      post :create, quiz_option: { content: @quiz_option.content }
    end

    assert_redirected_to quiz_option_path(assigns(:quiz_option))
  end

  test "should show quiz_option" do
    get :show, id: @quiz_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quiz_option
    assert_response :success
  end

  test "should update quiz_option" do
    patch :update, id: @quiz_option, quiz_option: { content: @quiz_option.content }
    assert_redirected_to quiz_option_path(assigns(:quiz_option))
  end

  test "should destroy quiz_option" do
    assert_difference('QuizOption.count', -1) do
      delete :destroy, id: @quiz_option
    end

    assert_redirected_to quiz_options_path
  end
end
