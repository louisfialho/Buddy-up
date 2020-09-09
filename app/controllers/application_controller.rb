class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :age, :favorite_sport, :gender, :language, :skill_level, :nickname, :description, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :age, :favorite_sport, :gender, :language, :skill_level, :nickname, :description, :photo])
  end

  def default_url_options
   { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
