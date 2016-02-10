require 'application_responder'

class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :side_menu

  NUMBER_TO_LIST = 20

  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception

  protected

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def side_menu
    @side_kitchens = Kitchen.all.order(name: :asc)
    @side_food_types = FoodType.all.order(name: :asc)
    @side_preferences = Preference.all.order(name: :asc)
  end

  def authenticate_admin!
    authenticate_user!
    sign_out_and_redirect(current_user) if !current_user.admin
  end

  def authenticate_owner_user!(object, path)
    authenticate_user!
    redirect_to path if current_user != object.user
  end
end
