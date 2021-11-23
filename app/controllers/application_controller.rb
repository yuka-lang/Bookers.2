class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!,except: [:top, :about]

  # helper_method :current_user, :logged_in?, :log_in, :login_check


  def after_sign_in_path_for(resource)
    user_path(resource)
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email , :name])
  end


end
