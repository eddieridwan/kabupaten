class Province < ActiveRecord::Base
  
  has_many :kabupatens
  
  scope :by_name, :order => :name
  
  validates_uniqueness_of :name
  
  def density
    (population / area.to_f).ceil if area.present?
  end
  
end
