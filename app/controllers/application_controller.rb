class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  layout :choose_layout
  before_action :configure_permitted_parameters, if: :devise_controller?

  def choose_layout
    (devise_controller? || controller_name == "home") ? "outside" :  "application"
  end

  def configure_permitted_parameters
    Rails.logger.info "configure_permitted_parameters"
    # Fields for sign up
    devise_parameter_sanitizer.permit(:sign_up, keys: [:id, :email, :firstname,:lastname, :password, :password_confirmation])
  end
end
