class CorporateController < ApplicationController
  def show
    case params[:page]
    when "about"
      render "about"
    when "contact"
      render "contact"
    end
  end
end