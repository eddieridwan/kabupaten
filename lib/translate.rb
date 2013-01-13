module Translate

  def self.translate(from, to, text)
    google_url = "http://translate.google.com/?sl=#{from.to_s}&tl=#{to.to_s}&q="
    agent = Mechanize.new

    html_elements = Nokogiri::HTML::DocumentFragment.parse(text)

    # translate each text element, as google translate does not preserve the html tags
    html_elements.children.each do |element|
      element.traverse do |node|
        if node.text?
          # @page = agent.get(google_url + node.text)
          # node.content = @page.search("#result_box").text
          node.content = "translated"
        end
      end
    end

    "<p><strong>[translated using google translate]</strong></p>" + html_elements.to_html
  end

  def self.for_translation?(object, column)
    object.translations.map{|t| ActionView::Base.full_sanitizer.sanitize(t.send(column.to_sym))}.reject(&:blank?).compact.present? &&
    ( object.translations.where(locale: I18n.locale).blank? ||
      ActionView::Base.full_sanitizer.sanitize(object.translations.where(locale: I18n.locale).first.description).blank?
    )
  end

end