class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_recipe, only: [:show]
  before_action :set_collections, only: [:new, :create]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    respond_with @recipe
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :kitchen_id, :food_type_id,
                                   :preference_id, :serves, :time, :difficulty,
                                   :ingredients, :steps, :photo)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def set_collections
    @kitchens = Kitchen.all
    @food_types = FoodType.all
    @preferences = Preference.all
  end
end
