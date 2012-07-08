class User < ActiveRecord::Base
	rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  has_many :projects
  
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  
  before_save :setup_role
  
  private
  
  # Setup default role
  def setup_role 
    self.add_role('contributor') unless self.roles.present?     
  end
  
  
end
