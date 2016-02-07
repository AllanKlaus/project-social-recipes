require 'application_responder'

class ApplicationController < ActionController::Base
  NUMBER_TO_LIST = 20

  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def authenticate_admin!
    authenticate_user!
    current_user.admin ||= sign_out_and_redirect(current_user)
  end

  def authenticate_owner_user!(object, path)
    authenticate_user!
    if current_user != object.user
      redirect_to path
    end
  end
end
