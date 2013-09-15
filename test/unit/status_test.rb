require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  # We want to create tests that will assert something we want to see!
  # I.E WE USE TESTS TO FIND POTENTIAL BUGS IN OUR APPLICATION!
  # We are creating a test where we create an empty status and assert an error for this case.
  # With this assertion, we know the test will fail. We have to edit our code to make it pass. i.e dont allow an empty status.
  # For example, we can edit our code or use validations to mediate this error.
  test "that a status requires content" do
  	# create a new status
  	status = Status.new
  	# Assert that the status cant save.
  	assert !status.save
  	# Asserts that we will have an error on our content field. i.e makes the test fail! 
  	assert !status.errors[:content].empty?
  	# From this we expect that our assertion fails. We have to open our status model (status.rb) to make it pass. i.e make it work when a user enters an empty string.
  end

  # We are creating a test where we create a 1 char status and assert an error.
  # Now we know this test will fail, so we want to fix our code to make this test pass. i.e dont allow a status with 2 characters.
  # For example, we can edit our code or use validations to mediate this error.
  test "that a status's content is at least 2 letters" do
  	status = Status.new
  	status.content = "H"
  	assert !status.save
  	# Asserts that we will have an error on our content field. i.e makes the test fail! 
  	assert !status.errors[:content].empty?
  end

  test "that a status has a user id" do
  	status = Status.new
  	# Must include this becuase of the validations we wrote due to the above tests.
  	status.content = "Hello"
  	# However, after testing the app. The save assertion fails, meaning that the status did get saved. We must validate this.
  	assert !status.save
  	# Asserts that there are errors on the user ID column.
  	assert !status.errors[:user_id].empty?
  end

end
