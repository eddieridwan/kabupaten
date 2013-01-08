module Translate

  def self.translate(from, to, text)
    google_url = "http://translate.google.com/?sl=#{from.to_s}&tl=#{to.to_s}&q="
    agent = Mechanize.new
    @page = agent.get(google_url + text)
    "(translated using google translate) " + @page.search("#result_box").text
  end

  def self.for_translation?(object, column)
    object.translations.map{|t| t.send(column.to_sym)}.present? &&
    (object.translations.where(locale: I18n.locale).blank? || object.translations.where(locale: I18n.locale).first.description.blank?)
  end

end