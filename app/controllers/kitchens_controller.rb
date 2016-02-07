class KitchensController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create]
  before_action :set_kitchen, only: [:show]

  def index
    @kitchens = Kitchen.all
  end

  def show
  end

  def new
    @kitchen = Kitchen.new
  end

  def create
    @kitchen = Kitchen.create(kitchen_params)
    respond_with @kitchen
  end

  private

  def authenticate_admin!
    authenticate_user!
    current_user.admin ||= sign_out_and_redirect(current_user)
  end

  def kitchen_params
    params.require(:kitchen).permit(:name)
  end

  def set_kitchen
    @kitchen = Kitchen.find(params[:id])
  end
end
