class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :add_role_to_cookies, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :name])
  end

  def after_sign_up_path_for(resource_or_scope)
    if current_user.role == 'restaurant'
      restaurant_new
    else
      candidate_new
    end
  end
  def add_role_to_cookies
    if params[:role].present?
      session[:role] = params[:role]
    end
  end


end
