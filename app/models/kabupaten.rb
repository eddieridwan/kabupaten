class Kabupaten < ActiveRecord::Base
  translates :description, :fallbacks_for_empty_translations => true
  include Locale
  store :health_indicators, accessors: [:female_life_expectancy, :male_life_expectancy]

  belongs_to  :province
  belongs_to  :category, :class_name => 'Dt2Category'
  has_many    :project_kabupaten_mappings
  has_many    :projects, :through => :project_kabupaten_mappings

  scope :in_province, lambda { |province| where("province_id = ?", province) }

  validates_uniqueness_of :name

  before_save :strip_empty_html_translation_fields

  def category_name
    category.name + ' ' + name
  end

  def density
    (population / area.to_f).ceil if area.present?
  end


  private

  def strip_empty_html_translation_fields
    # http://stackoverflow.com/questions/7414267/strip-html-from-string-ruby-on-rails
    self.description = nil if ActionView::Base.full_sanitizer.sanitize(description).strip.blank?
  end

end
