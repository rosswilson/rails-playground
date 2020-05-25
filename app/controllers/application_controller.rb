class ApplicationController < ActionController::Base
  helper_method :current_user

  before_action :require_current_user

  def current_user
    user_id = session[:current_user_id]

    @current_user ||= User.find_by_id(user_id) if user_id
  end

  def require_current_user
    redirect_to signin_path, notice: 'Please sign in to continue.' unless current_user
  end
end
