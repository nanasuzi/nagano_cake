class ApplicationController < ActionController::Base
  before_action :configure_permtted_parameters, if: :devise_controller?

  protected

  def configure_permtted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active, default: true])
  end
end
