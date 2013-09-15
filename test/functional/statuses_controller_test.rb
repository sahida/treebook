require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end
# Before, this wrote that a new status would be successful and redirect you to the new status page.
# We are changing it to a redirect to the login page. A user must sign in to view the statuses.
# Note that here there is NOBODY SIGNED IN, so they shouldnt be redirected to the new status page.
  test "should be redirected when user is not logged on" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

# Makes sure we can actually get the new page when we are logged in. TEST
# sign_in users(:dj) will sign in the fixture "dj" for the purpose of this test.
# Note that here, we are testing when a user does sign in, we will get the new status page successfully.
  test "should render the new(status) page when we are logged in" do
    sign_in users(:dj)
    get :new
    assert_response :success
  end

  test "should be logged in to post a status" do
    post :create, status: { content: "Hello 23123"}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create status when logged in" do
    sign_in users(:dj) #Added to fix a login error in our written test.
    assert_difference('Status.count') do
      post :create, status: { content: @status.content }
    end

    assert_redirected_to status_path(assigns(:status))
  end

  test "should show status" do
    get :show, id: @status
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @status
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get edit when logged in" do
    sign_in users(:dj)
    get :edit, id: @status
    assert_response :success
  end

  test "should redirect status update when not logged in" do
    put :update, id: @status, status: { content: @status.content }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update status when logged in" do
    sign_in users(:dj)
    put :update, id: @status, status: { content: @status.content }
    assert_redirected_to status_path(assigns(:status))
  end

  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end

    assert_redirected_to statuses_path
  end
end
