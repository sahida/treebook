require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
  	# id: is a key given to us by rails and says we want to send in a persons profile name.
  	# This is based on our fixture user dj
  	# If it works for the test users, it will work for any user.
    get :show, id: users(:dj).profile_name
    assert_response :success
    # Asserts that the correct template (views are displayed). This one is in profiles/show
    assert_template "profiles/show"
  end

  test "should render a 404 on profile not found" do
  	get :show, id: "doesn't exist"
  	# Should orginally fail, but pass after we write the code in the profiles controller.
  	assert_response :not_found
  end

  test "that variables are assigned on successful profile viewing" do
  	get :show, id: users(:dj).profile_name
  	# Assigns method contains instance variables from controllers in a controller test.
  	# This asserts that this variable exists.
  	assert assigns(:user)
  	# Assigns method confrims that a controllers instance variable @user or @statuses exists.
  	# Asserts that statuses are set on the profile page. Should fail before we add the code.
  	assert_not_empty assigns(:statuses)
  end

  test "only shows the correct users status" do
  	get :show, id: users(:dj).profile_name
  	assigns(:statuses).each do |status|
  		# Asserts that the user in the current session matches the each statuses user on the profile page.
  		assert_equal users(:dj), status.user
  	end
  	# Will fail before we add the code to fix this.
  end

end
