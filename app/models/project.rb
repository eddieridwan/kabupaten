class Project < ActiveRecord::Base
  include Locale
  
  attr_accessible :description_en, :name_en, :description_id, :name_id, :project_kabupaten_mappings_attributes
  
  belongs_to :user
  
  has_many :project_kabupaten_mappings
  has_many :kabupatens, :through => :project_kabupaten_mappings
  has_many :project_contact_mappings
  has_many :contacts, :through => :project_contact_mappings
  has_many :project_sector_mappings
  has_many :sectors, :through => :project_sector_mappings
  
  accepts_nested_attributes_for :project_kabupaten_mappings, :reject_if => :all_blank, :allow_destroy => true
  
end
