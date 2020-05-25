class SessionController < ApplicationController
  skip_before_action :require_current_user
  before_action :redirect_if_already_signed_in, only: [:new, :create]

  def new
  end

  def create
    @email = params[:email]

    @user = User.find_by_email(@email).try(:authenticate, params[:password])

    if @user
      reset_session

      session[:current_user_id] = @user.id

      redirect_to root_path, notice: 'You have been signed in.'
    else
      flash.now[:error] = "Incorrect email address or password."

      render :new
    end
  end

  def destroy
    reset_session

    redirect_to signin_path, notice: 'You have been signed out.'
  end

  private
    def redirect_if_already_signed_in
      redirect_to root_url if current_user
    end
end
