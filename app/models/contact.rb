class Contact < ActiveRecord::Base
  attr_accessible :email, :name, :skype_handle, :twitter_handle

  has_many :project_contact_mappings
  has_many :projects, :through => :project_contact_mappings

end
