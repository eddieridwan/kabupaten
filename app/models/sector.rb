class Sector < ActiveRecord::Base
  attr_accessible :description_en, :name_en, :description_id, :name_id

  has_many :project_sector_mappings
  has_many :projects, :through => :project_sector_mappings
  
  scope :by_name, lambda {{ :order => "name_#{I18n.locale} ASC" }}

end
