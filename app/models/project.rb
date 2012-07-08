class Project < ActiveRecord::Base
  attr_accessible :description_en, :name_en, :description_id, :name_id
  
  belongs_to :user
  
  has_many :project_kabupaten_mappings
  has_many :kabupatens, :through => :project_kabupaten_mappings
  has_many :project_contact_mappings
  has_many :contacts, :through => :project_contact_mappings
  has_many :project_sector_mappings
  has_many :sectors, :through => :project_sector_mappings
  
end
