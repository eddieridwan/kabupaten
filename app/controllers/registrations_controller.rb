class RegistrationsController < ApplicationController

  # skip_authorization_check
  load_and_authorize_resource :class => "User"

  def show
    @user = User.find(params[:id])

    # Triggered from user view -- show registration info
    render 'devise/registrations/show.html.haml'
  end

end
