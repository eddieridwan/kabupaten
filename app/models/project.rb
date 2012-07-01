class Project < ActiveRecord::Base
  attr_accessible :description_en, :name_en, :description_id, :name_id
  
  has_and_belongs_to_many :kabupatens, :join_table => 'project_kabupaten_mappings'
  has_and_belongs_to_many :contacts, :join_table => 'project_contact_mappings'
  has_and_belongs_to_many :sectors, :join_table => 'project_sector_mappings'
  
end
