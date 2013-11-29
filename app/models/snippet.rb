class Snippet < ActiveRecord::Base
  translates :body, :fallbacks_for_empty_translations => true

  attr_accessible :key, :description, :body

  before_save :strip_empty_html_translation_fields

  private

  def strip_empty_html_translation_fields
    # http://stackoverflow.com/questions/7414267/strip-html-from-string-ruby-on-rails
    self.body = nil if ActionView::Base.full_sanitizer.sanitize(body).blank?
  end

end
