class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configrue_permitted_parameters, if: :devise_controller?

  protected

  def configrue_permitted_parameters
    added_attrs = [:email, :password, :password_confirmation, :remember_me,
                   :avatar, :avatar, :avatar_cache]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end
end
