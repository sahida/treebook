require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
# If the test passes, we created the custom routes successfully.
  test "that /login route opens the login page" do
  	# Custom path you want to go to.
  	get "/login"
  	# Asserts that this request should be successful. If not, there is an error in custom routes.
  	assert_response :success 
  end

  test "that /logout route opens the logout page" do
  	# Custom path you want to go to.
  	get "/logout"
  	# Asserts that this response is a redirect.
  	assert_response :redirect
  	# Asserts that this is the page redirected to. If not, there is an error in custom routes.
  	assert_redirected_to "/"
  end

  test "that /register route opens the register page" do
  	# Custom path you want to go to.
  	get "/register"
  	# Asserts that this request should be successful. If not, there is an error in custom routes.
  	assert_response :success 
  end

  test "that a profile page works" do
    get "/sahida"
    assert_response :success
  end
  
end
