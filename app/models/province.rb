class Province < ActiveRecord::Base
  
  has_many :kabupatens
  
  validates_uniqueness_of :name
  
end
