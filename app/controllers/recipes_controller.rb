class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :my]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do
    authenticate_owner_user!(@recipe, my_recipes_path)
  end
  before_action :set_collections, only: [:new, :create, :edit, :update]

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

  def edit
  end

  def update
    @recipe.update(recipe_params)
    respond_with @recipe
  end

  def destroy
    @recipe.destroy
    redirect_to my_recipes_path
  end

  def my
    @recipes = current_user.recipes
  end

  private

  def recipe_params
    user = { user: current_user }
    params.require(:recipe).permit(:name, :kitchen_id, :food_type_id,
                                   :preference_id, :serves, :time, :difficulty,
                                   :ingredients, :steps, :photo).merge(user)
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
