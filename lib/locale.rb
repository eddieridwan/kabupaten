module Locale

  module ClassMethods
  end

  module InstanceMethods

    def alt_locale_attr(attr_name)
      current_locale = I18n.locale
      I18n.locale = alt_locale
      alt_attr = self.send(attr_name)
      I18n.locale = current_locale
      alt_attr
    end

    def locale_attr_or_alt(attr_name)
      self.send(attr_name).present? ? self.send(attr_name) : alt_locale_attr(attr_name)
    end

  end

  def alt_locale
    I18n.locale == :id ? :en : :id
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end

private

end