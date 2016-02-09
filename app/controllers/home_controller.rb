class HomeController < ApplicationController
  def index
    @recipes = Recipe.last(NUMBER_TO_LIST)
    @recipes_favorites = Recipe.joins(favorites: :user)
                               .group(:recipe_id)
                               .limit(NUMBER_TO_LIST)
                               .order("COUNT('recipes'.'id') DESC")
  end
end
