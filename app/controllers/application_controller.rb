class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :add_role_to_cookies, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :name])
  end

  def after_sign_up_path_for(user)
    if current_user.role == 'restaurant'
      new_restaurant_path
    else
      new_candidate_path
    end
  end

  def after_sign_in_path_for(user)
    if current_user.role == 'restaurant'
      @restaurant = Restaurant.find_by(user: current_user)
      if @restaurant
        restaurant_path(@restaurant)
      else
        new_restaurant_path
      end
    else
      @candidate = Candidate.find_by(user: current_user)
      if @candidate
        candidate_path(@candidate)
      else
        new_candidate_path
      end
    end
  end

  def add_role_to_cookies
    if params[:role].present?
      session[:role] = params[:role]
    end
  end


end
