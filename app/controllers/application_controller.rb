class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:email, :password,:password_confirmation, :remember_me,:first,:last,:code)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:email, :password,:password_confirmation, :current_password,:first,:last,:code)
    end
  end
  
end
