class Kabupaten < ActiveRecord::Base
  translates :description, :fallbacks_for_empty_translations => true
  store :health_indicators, accessors: [:female_life_expectancy, :male_life_expectancy]

  belongs_to  :province
  belongs_to  :category, :class_name => 'Dt2Category'
  has_many    :project_kabupaten_mappings
  has_many    :projects, :through => :project_kabupaten_mappings

  validates_uniqueness_of :name

  before_save :strip_empty_description

  def category_name
    category.name + ' ' + name
  end

  def density
    (population / area.to_f).ceil if area.present?
  end

  private

  def strip_empty_description
    self.description = nil if ActionView::Base.full_sanitizer.sanitize(description).blank?
  end

end
