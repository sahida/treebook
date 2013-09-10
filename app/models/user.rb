class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model (IN DATABASE)
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :profile_name
  # attr_accessible :title, :body

  #The opposite of belongs_to. This says that a User has many statuses. This links multiple statuses to a user.
  has_many :statuses

  def full_name
  	first_name + " " + last_name
  end
end
