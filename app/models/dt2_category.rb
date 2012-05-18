class Dt2Category < ActiveRecord::Base
  
  has_many :kabupatens
  
  validates_uniqueness_of :name
  
end
