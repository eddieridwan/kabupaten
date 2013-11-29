class Project < ActiveRecord::Base
  translates :name, :description, :fallbacks_for_empty_translations => true
  include Locale

  self.table_name = 'projects'

  attr_accessible :description, :name, :project_kabupaten_mappings_attributes

  belongs_to :user

  has_many :project_kabupaten_mappings
  has_many :kabupatens, :through => :project_kabupaten_mappings
  has_many :project_contact_mappings
  has_many :contacts, :through => :project_contact_mappings
  has_many :project_sector_mappings
  has_many :sectors, :through => :project_sector_mappings

  scope :in_kabupaten, lambda { |kabupaten| includes(:kabupatens).where("kabupatens.id = ?", kabupaten) }
  scope :in_sector, lambda { |sectors| includes(:sectors).where("sectors.id IN (?)", sectors) }
  scope :search, lambda { |term|
    term = '%' + term.to_s.downcase + '%'
    where( "LOWER(name) LIKE ? OR LOWER(description) LIKE ?", term, term).limit(100)
  }

  accepts_nested_attributes_for :project_kabupaten_mappings, :reject_if => :all_blank, :allow_destroy => true

  before_save :strip_empty_html_translation_fields

  class << self

    # In location AND contains search terms AND in sectors
    def filter(conditions)
      result = []
      result += in_kabupaten(conditions[:kabupaten_id]) if conditions[:kabupaten_id].present?
      if conditions[:search].present?
        result = result.present? ? result & search(conditions[:search]) : search(conditions[:search])
      end
      sectors = conditions[:sector_id].present? ? conditions[:sector_id].reject{|s| s.empty?} : []
      if sectors.present?
        result = result.present? ? result & in_sector(sectors) : in_sector(sectors)
      end
      result.uniq
    end

  end

  private

  def strip_empty_html_translation_fields
    # http://stackoverflow.com/questions/7414267/strip-html-from-string-ruby-on-rails
    self.description = nil if ActionView::Base.full_sanitizer.sanitize(description).blank?
  end

end
