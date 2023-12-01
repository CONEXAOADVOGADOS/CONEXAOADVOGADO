class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    array_permit = %i[name cpf phone email password password_confirmation current_passwor]
    devise_parameter_sanitizer.permit(:sign_up, keys: array_permit)
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[login email password remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: array_permit)
  end
end
