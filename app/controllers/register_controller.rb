class RegisterController < ApplicationController
  skip_before_action :require_current_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.with(user: @user).welcome_email.deliver_later

      reset_session

      session[:current_user_id] = @user.id

      redirect_to root_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
