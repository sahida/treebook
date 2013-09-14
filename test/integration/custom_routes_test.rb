require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
# If the test passes, we created the custom routes successfully.
  test "that /login route opens the login page" do
  	# Custom path you want to go to.
  	get "/login"
  	# Makes sure that this request is successful.
  	assert_response :success 
  end

  test "that /logout route opens the logout page" do
  	# Custom path you want to go to.
  	get "/logout"
  	# Logout is a redirect, not a request to a page. So we must indicate this.
  	assert_response :redirect
  	# / indicates index
  	assert_redirected_to "/"
  end

  test "that /register route opens the register page" do
  	# Custom path you want to go to.
  	get "/register"
  	# Makes sure that this request is successful.
  	assert_response :success 
  end

end
