class ProjectSectorMapping < ActiveRecord::Base
  
  belongs_to :project
  belongs_to :sector
    
end
