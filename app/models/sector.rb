class Sector < ActiveRecord::Base
  translates :name, :description, :fallbacks_for_empty_translations => true
  attr_accessible :name, :description

  has_many :project_sector_mappings
  has_many :projects, :through => :project_sector_mappings

  scope :by_name, lambda {{ :order => "name ASC" }}

end
