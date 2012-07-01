class Project < ActiveRecord::Base
  attr_accessible :en_description, :en_name, :id_description, :id_name
  
  has_and_belongs_to_many :kabupatens, :join_table => 'project_kabupaten_mappings'
  has_and_belongs_to_many :contacts, :join_table => 'project_contact_mappings'
  has_and_belongs_to_many :sectors, :join_table => 'project_sector_mappings'
  
end
