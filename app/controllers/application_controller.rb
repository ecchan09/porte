class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :gender, :job, :introduction, :picture])
    elsif resource_class == Owner
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :gender, :station, :introduction, :picture])
    else
      super
    end
  end
end
