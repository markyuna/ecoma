class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_locale
<<<<<<< HEAD
  before_action :configure_permitted_parameters, if: :devise_controller?
=======

>>>>>>> 58f4d0c1eab6984a7a92f69560cd70e40a54d62e

  private

  def set_locale
    I18n.locale = :fr # Or whatever logic you use to choose.
  end
<<<<<<< HEAD

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
=======
>>>>>>> 58f4d0c1eab6984a7a92f69560cd70e40a54d62e
end
