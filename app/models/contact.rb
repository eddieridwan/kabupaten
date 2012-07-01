class Contact < ActiveRecord::Base
  attr_accessible :email, :name, :skype_handle, :twitter_handle

  has_and_belongs_to_many :projects, :join_table => 'project_contact_mappings'

end
