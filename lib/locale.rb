module Locale
  
  module ClassMethods
  end

  module InstanceMethods
    
    def locale_attr(attr_name)
      self.send("#{attr_name}_#{I18n.locale}")
    end

    def alt_locale_attr(attr_name)
      self.send("#{attr_name}_#{alt_locale}")
    end
    
    def locale_attr_or_alt(attr_name)
      locale_attr(attr_name).present? ? locale_attr(attr_name) : alt_locale_attr(attr_name)
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