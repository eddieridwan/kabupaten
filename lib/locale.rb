module Locale

LOCALE_NAMES = {:en => "English", :id => "Bahasa Indonesia"}

  module ClassMethods
    # TODO: fix adding class methods here does not work
  end

  module InstanceMethods

    def alt_locale_attr(attr)
      translations.where(locale: Locale.alt_locale).first.try(:send, attr)
    end

    def locale_attr(attr)
      translations.where(locale: I18n.locale).first.try(:send, attr)
    end

    def locale_attr_or_alt_translation(attr)
      locale_attr(attr) || Translate.translate_alt_locale(alt_locale_attr(attr))
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