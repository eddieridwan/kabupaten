class Sector < ActiveRecord::Base
  attr_accessible :description_en, :name_en, :description_id, :name_id

  has_and_belongs_to_many :projects, :join_table => 'project_sector_mappings'
  
  scope :by_name, lambda {{ :order => "name_#{I18n.locale} ASC" }}

end
