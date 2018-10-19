class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

 protected

 def configure_permitted_parameters
   added_attrs = [ :username, :email, :password, :password_confirmation　]
   devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
   devise_parameter_sanitizer.permit :account_update, keys: added_attrs
   devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
 end

 private

 def logged_in_user
   unless logged_in?
     store_location
     flash[:danger] = "Please log in."
     redirect_to login_url
   end
 end
 def logged_in?
   !current_user.nil?
 end
end
