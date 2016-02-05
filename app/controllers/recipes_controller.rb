class RecipesController < ApplicationController
  before_action :set_collections, only: [:new, :create]
  def index
  end
  def new
    @recipe = Recipe.new
  end
  def create
  end

  private

  def set_collections
    @kitchens = Kitchen.all
    @food_types = FoodType.all
    @preferences = Preference.all
  end
end
