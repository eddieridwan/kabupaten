class ProjectKabupatenMapping < ActiveRecord::Base
  
  belongs_to :project
  belongs_to :kabupaten
    
end
