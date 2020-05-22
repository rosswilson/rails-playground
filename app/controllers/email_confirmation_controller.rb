class EmailConfirmationController < ApplicationController
  def create
    user = User.find_by_email_confirm_token(params[:id])

    if user
      user.email_activate

      flash[:notice] = 'Your email address has been confirmed.'
    else
      flash[:error] = "Sorry, that confirmation link is invalid."
    end

    redirect_to root_url
  end
end
