# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def content_given?(name)
    content = instance_variable_get("@content_for_#{name}")
    ! content.nil?
  end

  def locale_attr_or_alt_haml(object, attr_name)
    if object.send(attr_name).present?
      haml_tag :span, object.send(attr_name)
    else
      haml_tag :span, object.alt_locale_attr(attr_name), {class: 'alt_locale'}
      haml_tag :span, "(#{t('kabupaten.for_translation')})", {style: 'color: DarkGreen; font-size: 8pt'}
    end
  end

  def for_translation_haml(object, attr_name)
    unless object.send(attr_name).present?
      haml_tag :span, "(#{t('kabupaten.for_translation')})", {style: 'color: DarkGreen; font-size: 8pt'}
    end
  end

  # Translates the text of the element (pass the id) and then toggles between translation and original text
  # Requires translate.js
  def translate_button(element)
    haml_tag :p, { source: element, class: 'translate btn', style: 'margin: 10px 0 10px 0'} do
      haml_tag :span, {class: 'translate_text'} do
        haml_concat t('kabupaten.translate')
      end
      haml_tag :span, {class: 'untranslate_text', style: 'display:none'} do
        haml_concat t('kabupaten.original_text')
      end
      haml_tag :span, {class: 'original_text', style: 'display:none'}
      haml_tag :span, {class: 'translated_text', style: 'display:none'}
    end
  end

  def alt_locale
    I18n.locale == :id ? :en : :id
  end

  def display_flash(*names)
    if !names.empty?
      for name in names
        unless flash[name].blank?
          haml_tag :div, flash[name], {:id => name.to_s, :class => 'flash'}
        end
      end
    else
      display_flash(:notice, :error)
    end
    nil
  end

  def paginate_summary_info(model_str, entries)
    if entries.respond_to?(:total_pages)
      page_entries_info entries, :model => model_str.singularize
    else
      if entries.size > 1
        "Displaying <b>all #{entries.size}</b> #{model_str.pluralize}"
      else
        "Displaying <b>1</b> #{model_str.singularize}"
      end
    end
  end

  def locale_uri(locale)
    uri = URI.parse(request.env['REQUEST_URI'])
    domain = uri.host.split('.')[-2..-1].join('.')
    # Replace the subdomain -- assume there is at most one used for the locale
    uri.host = locale.present? ? locale + '.' + domain : domain
    uri.to_s
  end

  def add_button
    haml_concat(image_tag('buttons/add.png', :alt => 'Add', :style => 'float:right; padding-right: 2px'))
  end

  def remove_button
    haml_concat(image_tag('buttons/cross.png', :alt => 'Remove', :style => 'float: right; padding-right: 5px'))
  end

end
