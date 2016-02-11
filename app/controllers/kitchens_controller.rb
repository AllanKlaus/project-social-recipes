class KitchensController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update,
                                             :destroy]
  before_action :set_kitchen, only: [:show, :edit, :update, :destroy]

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

  def edit
  end

  def update
    @kitchen.update(kitchen_params)
    respond_with @kitchen
  end

  def destroy
    @kitchen.destroy
    redirect_to root_path
  end

  private

  def kitchen_params
    params.require(:kitchen).permit(:name)
  end

  def set_kitchen
    @kitchen = Kitchen.friendly.find(params[:id]).decorate
  end
end
