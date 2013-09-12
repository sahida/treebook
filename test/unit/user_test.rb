require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a user should enter a first name" do 
  	#user is a new instance of a User class (User Object!)
  	user = User.new
  	#Asserts that a user should not be saved in our db. i.e one without a first name. (WRONG)
  	assert !user.save
  	#Actually checks(asserts) if there are any errors in the first_name field of the user Object!
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do 
  	user = User.new
  	#In a test, we dont want to save a new user as is usually done, so we need to indicate this!
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do 
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
  	user = User.new
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
  #Tests are written for incorrect data before a validation has been included. We want it to fail before validation. 
  test "a user should have a profile name without spaces" do 
  	user = User.new
  	user.profile_name = "My Profile With Spaces"
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

end
