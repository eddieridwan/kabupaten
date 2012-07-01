class Sector < ActiveRecord::Base
  attr_accessible :description_en, :name_en, :description_id, :name_id

  has_and_belongs_to_many :projects, :join_table => 'project_sector_mappings'

end
