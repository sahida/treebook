class ProfilesController < ApplicationController
  def show
  	# Conditional will allow for both tests to pass. If a user is found, profile page is viewed. Else 404 is viewed.
  	@user = User.find_by_profile_name(params[:id])
  	if @user
  		# Can use in the views and controller! Instance variable
  		@statuses = @user.statuses.all
  		render action: :show
  	else 
  		render file: "public/404", status: 404, formats: [:html]
  	end
  end
end
