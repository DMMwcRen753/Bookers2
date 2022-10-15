class ApplicationController < ActionController::Base
before_action :authenticate_user!, except: [:top]
before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "Welcome! You have signed up successfully."
      user_path(current_user.id)
    else
      flash[:notice] = "Not Signed in successfully."
      new_user_registration_path
    end
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
