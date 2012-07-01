class Kabupaten < ActiveRecord::Base
  store :health_indicators, accessors: [:female_life_expectancy, :male_life_expectancy]
  
  belongs_to :province
  belongs_to :category, :class_name => 'Dt2Category'
  has_and_belongs_to_many :projects, :join_table => 'project_kabupaten_mappings'
  
  validates_uniqueness_of :name
  
  def category_name
    category.name + ' ' + name
  end
  
  def density
    (population / area.to_f).ceil if area.present?
  end
  
end
