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

  #Rails validation that makes sure that the users first_name is ENTERED when a User object is created/saved!
  #Other VALIDATIONS online in rails documentation.
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true,
                           uniqueness: true,
                           format: {
                            #Makes sure profile names contain every char except white space
                            with: /\A[a-zA-Z\-\_]+\Z/,
                            #If has white space, this failure messsage is specified.
                            message: "Must be formatted correctly."
                            }

  def full_name
  	first_name + " " + last_name
  end
end
