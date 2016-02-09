class KitchensController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create]
  before_action :set_kitchen, only: [:show]

  def index
    @kitchens = Kitchen.all
  end

  def show
    @recipes = Recipe.where(kitchen_id: @kitchen.id)
  end

  def new
    @kitchen = Kitchen.new
  end

  def create
    @kitchen = Kitchen.create(kitchen_params)
    respond_with @kitchen
  end

  private

  def kitchen_params
    params.require(:kitchen).permit(:name)
  end

  def set_kitchen
    @kitchen = Kitchen.find(params[:id])
  end
end
