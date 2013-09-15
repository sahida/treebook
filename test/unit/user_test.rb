require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a user should enter a first name" do 
  	# user is a new instance of a User class (User Object!)
  	user = User.new
  	# Asserts that our test user should not be saved. If test fails here, user was saved and we must edit our code.
  	assert !user.save
  	# Asserts that there is an error in the first name of our test user.
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do 
  	user = User.new
  	#Asserts that our test user should not be saved.
  	assert !user.save
    # Asserts that there is an error in the last name of our test user.
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do 
  	user = User.new
    # Asserts that our test user should not be saved.
  	assert !user.save
    # Asserts that there is an error the profile name of our test user.
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
  	user = User.new
    # Creates a full profile for our test user. Required for uniquness test.
  	user.profile_name = users(:dj).profile_name 
  	# user.email = "dsahi1991@gmail.com"
  	# user.first_name = "DJ"
  	# user.last_name = "Sahi"
  	# user.password = "password"
  	# user.password_confirmation = "password"
  	#Must write a workaround in fixtures as the user described above wants to save!
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do 
    # Creates a test user with the correct formatting!
  	user = User.new(first_name: "Damanjeet", last_name: "Sahi", email: "sahida@umich.edu")
    user.password = user.password_confirmation = "asdaksjd"
    # Creates a test profile name with spaces
  	user.profile_name = "My Profile With Spaces"
    # Asserts that we dont save this test user.
  	assert !user.save
    # Asserts that there is an error in the profile name.
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "a user can have a correctly formatted profile name" do
    user = User.new(first_name: "Damanjeet", last_name: "Sahi", email: "sahida@umich.edu")
    user.password = user.password_confirmation = "asdaksjd"
    user.profile_name = "sahida_1"
    # Will fail before we fix the format, and pass after.
    assert user.valid?
  end

end
