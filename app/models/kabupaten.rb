class Kabupaten < ActiveRecord::Base
  
  belongs_to :province
  belongs_to :category, :class_name => 'Dt2Category'
  
  validates_uniqueness_of :name
  
  def category_name
    category.name + ' ' + name
  end
  
end
