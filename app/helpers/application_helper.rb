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
end
