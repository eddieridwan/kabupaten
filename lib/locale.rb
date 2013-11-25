module Locale

LOCALE_NAMES = {:en => "English", :id => "Bahasa Indonesia"}

  module ClassMethods
    def self.locale_name
      LOCALE_NAMES[I18n.locale.to_sym]
    end
  end

  module InstanceMethods

    def alt_locale_attr(attr_name)
      current_locale = I18n.locale
      I18n.locale = Locale.alt_locale
      alt_attr = self.send(attr_name)
      I18n.locale = current_locale
      alt_attr
    end

    def locale_attr_or_alt(attr_name)
      self.send(attr_name).present? ? self.send(attr_name) : alt_locale_attr(attr_name)
    end

  end

  def self.alt_locale
    I18n.locale == :id ? :en : :id
  end

  def self.locale_name
    LOCALE_NAMES[I18n.locale.to_sym]
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end

private

end