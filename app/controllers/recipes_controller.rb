class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :my,
                                            :add_favorite, :favorite]
  before_action :set_recipe, only: [:show, :edit, :update,
                                    :destroy, :add_favorite]
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

  def add_favorite
    Favorite.create(user: current_user, recipe: @recipe)
    @recipes = Recipe.joins(favorites: :user)
                     .where(users: { id: current_user.id })
    render 'favorite'
  end

  def favorite
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
# user = User.create(email: 'email@email.com', password: '12345687')
# food = FoodType.create(name: 'FoodType')
# preference = Preference.create(name: 'Preference')
# kitchen = Kitchen.create(name: 'Kitchen')
# 5.times do |index|
# Recipe.create(name: "Recipe #{index}", kitchen:kitchen, food_type:food,
# preference:preference, serves: '10', time:'60', difficulty: 'Easy',
# user: user)
# end
# Recipe.joins(favorites: :user).where(users: {id: user2.id})
