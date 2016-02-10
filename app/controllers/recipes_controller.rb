class RecipesController < ApplicationController
  # layout "application_without_side_menu", only: [:new, :edit]
  before_action :authenticate_user!, only: [:new, :create, :my,
                                            :add_favorite, :favorite,
                                            :recommend, :send_recommend]
  before_action :set_recipe, only: [:show, :edit, :update,
                                    :destroy, :add_favorite,
                                    :recommend, :send_recommend]
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
    @recipes = Recipe.joins(favorites: :user)
                     .where(users: { id: current_user.id })
  end

  def recommend
    @user = User.new
  end

  def send_recommend
    current_user.send_recipe(current_user, @recipe, recommend_params)
    @friend = recommend_params
    render 'recommend'
  end

  def search
    @recipes = Recipe.where('name LIKE ?', "%#{search_params[:search]}%")
    render :index
  end

  private

  def recipe_params
    user = { user: current_user }
    params.require(:recipe).permit(:name, :kitchen_id, :food_type_id,
                                   :preference_id, :serves, :time, :difficulty,
                                   :ingredients, :steps, :photo).merge(user)
  end

  def search_params
    params.require(:recipe).permit(:search)
  end

  def recommend_params
    subject = { subject: t('mail.subject.send_recipe') }
    params.permit(:name, :mail, :message).merge(subject)
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
