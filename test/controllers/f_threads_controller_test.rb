require 'test_helper'

class FThreadsControllerTest < ActionController::TestCase
  setup do
    @f_thread = f_threads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:f_threads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create f_thread" do
    assert_difference('FThread.count') do
      post :create, f_thread: { date: @f_thread.date, sub_category_id: @f_thread.sub_category_id, subject: @f_thread.subject }
    end

    assert_redirected_to f_thread_path(assigns(:f_thread))
  end

  test "should show f_thread" do
    get :show, id: @f_thread
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @f_thread
    assert_response :success
  end

  test "should update f_thread" do
    patch :update, id: @f_thread, f_thread: { date: @f_thread.date, sub_category_id: @f_thread.sub_category_id, subject: @f_thread.subject }
    assert_redirected_to f_thread_path(assigns(:f_thread))
  end

  test "should destroy f_thread" do
    assert_difference('FThread.count', -1) do
      delete :destroy, id: @f_thread
    end

    assert_redirected_to f_threads_path
  end
end
