class FoodTypesController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update,
                                             :destroy]
  before_action :set_food_type, only: [:show, :edit, :update, :destroy]

  def index
    @food_types = FoodType.all
  end

  def show
  end

  def new
    @food_type = FoodType.new
  end

  def create
    @food_type = FoodType.create(food_type_params)
    respond_with @food_type
  end

  def edit
  end

  def update
    @food_type.update(food_type_params)
    respond_with @food_type
  end

  def destroy
    @food_type.destroy
    redirect_to root_path
  end

  private

  def food_type_params
    params.require(:food_type).permit(:name)
  end

  def set_food_type
    @food_type = FoodType.friendly.find(params[:id]).decorate
  end
end
