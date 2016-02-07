class HomeController < ApplicationController
  def index
    @recipes = Recipe.last(NUMBER_TO_LIST)
    @recipes_favorites = Recipe.order(favorite: :desc).limit(NUMBER_TO_LIST)
  end
end
