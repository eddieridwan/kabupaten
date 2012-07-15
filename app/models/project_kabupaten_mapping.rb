class ProjectKabupatenMapping < ActiveRecord::Base
  attr_accessible :project_id, :kabupaten_id, :location_type
  
  belongs_to :project
  belongs_to :kabupaten
    
end
