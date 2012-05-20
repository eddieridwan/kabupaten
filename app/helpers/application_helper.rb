# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def content_given?(name)
    content = instance_variable_get("@content_for_#{name}")
    ! content.nil?
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
  
end
