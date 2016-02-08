class HomeController < ApplicationController
  def index
    @recipes = Recipe.last(NUMBER_TO_LIST)
    @recipes_favorites = Recipe.joins(favorites: :user)
                               .group(:recipe_id)
                               .limit(NUMBER_TO_LIST)
                               .order("COUNT('recipes'.'id') DESC")

    @kitchens = Kitchen.all.order(name: :asc)
    @food_types = FoodType.all.order(name: :asc)
    @preferences = Preference.all.order(name: :asc)
  end
end
