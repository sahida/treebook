class Status < ActiveRecord::Base
	#user_id is not native
  attr_accessible :content, :user_id 
  	#user is native to ruby and can recognize user_id
  	#Allows us retrieve a user for a given status (status.user). Then we can use ser methods on this user obj to return the name of the user!
  	#A Status belongs_to only one user. Allows us to retrieve a status that belongs to a single user.
  belongs_to :user
end
