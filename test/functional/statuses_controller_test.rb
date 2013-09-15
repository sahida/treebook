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
  # The test feature allows you to use your application as if its online!
  test "should be redirected when user is not logged on" do
    # GET the new status page for a user who hasn't signed in.
    get :new
    # Asserts that this user will be redirected to the sign in page.
    assert_response :redirect
    assert_redirected_to new_user_session_path
    # Before adding our before_filter. This test will fail as this doesnt happen. After adding it it will pass!
  end

# Makes sure we can actually get the new page when we are logged in. TEST
# sign_in users(:dj) will sign in the fixture "dj" for the purpose of this test.
# Note that here, we are testing when a user does sign in, we will get the new status page successfully.
  test "should render the new(status) page when we are logged in" do
    # signs in the status fixture user dj
    sign_in users(:dj)
    # GET the new statuses page.
    get :new
    # Asserts that the request is successful.
    assert_response :success
    # This assertion should pass before the before_filter in the controller AND AFTER!
  end

  test "should be logged in to post a status" do
    # POST status with given content, when a user is NOT signed in.
    post :create, status: { content: "Hello 23123"}
    # Asserts that this redirects to a new user session path.
    assert_response :redirect
    assert_redirected_to new_user_session_path
    # This assertion should fail before the before_filter and pass after.
  end

  test "should create status when logged in" do
    # Signs in the status fixture user dj.
    sign_in users(:dj)
    # Asserts that a status is created by a user and added to the feed.
    assert_difference('Status.count') do
      post :create, status: { content: @status.content }
    end

    assert_redirected_to status_path(assigns(:status))
    # This assertion should pass before the before_filter AND AFTER!
  end

  test "should show status" do
    # GET the individual status page. (Anyone can do this, no need for two tests)
    get :show, id: @status
    # Assert this request was successful.
    assert_response :success
    # This test should pass before/after the before_filter. 
  end

  test "should redirect edit when not logged in" do
    # GET the edit page of a status when a user is not logged in.
    get :edit, id: @status
    # Assert that this user is redirected to a login page.
    assert_response :redirect
    assert_redirected_to new_user_session_path
    # This asserttion should fail before the before_filter and pass after.
  end

  test "should get edit when logged in" do
    # Signs in the fixture user dj
    sign_in users(:dj)
    # GET the edit page for a given status of this user.
    get :edit, id: @status
    # Assert that this request is successful.
    assert_response :success
    # This assertion should pass before the before_filter AND AFTER.
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
