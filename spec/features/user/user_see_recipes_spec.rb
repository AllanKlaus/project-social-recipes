require 'rails_helper'

feature 'User see a recipes' do
  scenario 'on home' do
    repeat_times = 20
    recipe_old = create_list(:recipe, repeat_times)
    recipe_favorites = create_list(:recipe, repeat_times)
    recipe = create_list(:recipe, repeat_times)

    repeat_times.times do |index|
      create_list(:favorite, index + 1, recipe: recipe_favorites[index])
    end

    visit root_path

    repeat_times.times do |index|
      expect(page).to have_content recipe[index].name
      expect(page).to have_content recipe[index].preference.name
      expect(page).to have_content recipe[index].food_type.name
      expect(page).to have_content recipe[index].kitchen.name
      expect(page).to have_content recipe[index].difficulty

      expect(page).to_not have_content recipe_old[index].name

      expect(page).to have_content recipe_favorites[index].name
      expect(page).to have_content recipe_favorites[index].preference.name
      expect(page).to have_content recipe_favorites[index].food_type.name
      expect(page).to have_content recipe_favorites[index].kitchen.name
      expect(page).to have_content recipe_favorites[index].difficulty
    end
  end

  scenario 'on recipe_path' do
    recipe = create(:recipe)
    visit recipe_path(recipe)

    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.user.name
    expect(page).to have_content recipe.preference.name
    expect(page).to have_content recipe.food_type.name
    expect(page).to have_content recipe.kitchen.name
    expect(page).to have_content recipe.serves
    expect(page).to have_content recipe.time
    expect(page).to have_content recipe.difficulty

    expect(page).to have_content recipe.ingredients
    expect(page).to have_content recipe.steps
    expect(page).to have_css("img[src*='#{recipe.photo.url(:thumb)}']")
  end
end
