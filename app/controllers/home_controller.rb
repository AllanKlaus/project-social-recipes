class HomeController < ApplicationController
  def index
    @recipes = Recipe.last(NUMBER_TO_LIST)
    @recipes_favorites = Recipe.order(favorite: :desc).limit(NUMBER_TO_LIST)

    @kitchens = Kitchen.all.order(name: :asc)
    @food_types = FoodType.all.order(name: :asc)
    @preferences = Preference.all.order(name: :asc)
  end
end
