class TranslateController < ApplicationController

  def translate
    translation = Translate.translate(Locale.alt_locale, I18n.locale, params[:content])
    render :text => translation
  end
end
