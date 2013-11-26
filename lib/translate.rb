module Translate

  def self.translate_alt_locale(text)
    self.translate(Locale.alt_locale, I18n.locale, text)
  end

  def self.translate(from, to, text)
    # http://stackoverflow.com/questions/7414267/strip-html-from-string-ruby-on-rails
    return if ActionView::Base.full_sanitizer.sanitize(text).blank?

    google_url = "http://translate.google.com/?sl=#{from.to_s}&tl=#{to.to_s}&q="
    agent = Mechanize.new

    html_elements = Nokogiri::HTML::DocumentFragment.parse(text)

    # translate each text element, as google translate does not preserve the html tags
    html_elements.children.each do |element|
      element.traverse do |node|
        if node.text?
          # @page = agent.get(google_url + node.text)
          # node.content = @page.search("#result_box").text
          node.content = I18n.locale == :en ? "translated" : 'terjemahan'
        end
      end
    end

    "<p><strong>[translated using google translate]</strong></p>" + html_elements.to_html
  end

  # Assumes html fields (eg description) do not have empty tags (see before_save for translated models)
  # A translation field is for translation if a translation exists, but not for the current locale.
  def self.for_translation?(object, column)
    object.translations.map{|t| t.send(column.to_sym)}.reject(&:blank?).compact.present? &&
    ( object.translations.where(locale: I18n.locale).blank? ||
      object.translations.where(locale: I18n.locale).first.send(column.to_sym).blank?
    )
  end

end