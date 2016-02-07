class HomeController < ApplicationController
  def index
    @recipes = Recipe.last(3)
    @recipes_favorites = Recipe.order(favorite: :desc).limit(3)
  end
end
