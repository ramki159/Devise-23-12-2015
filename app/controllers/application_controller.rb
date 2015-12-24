class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :Organization_name, :Organization_ID, :Individual_ID, :level, :designation, :role) }
            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :Organization_name, :Organization_ID, :Individual_ID, :level, :designation, :role) }
        end
	# def after_sign_in_path_for(resource)
 #    home_index_path 
 #  end
  
  def after_sign_in_path_for(user)
    home_index_path
  end

  def after_sign_out_path_for(user)
    root_path
  end
end
