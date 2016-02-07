require 'rails_helper'

feature 'User see a recipes' do
  scenario 'on home' do
    recipe_old = create_list(:recipe, 3)
    recipe_favorites = create_list(:recipe, 3, favorite: 20)
    recipe = create_list(:recipe, 3)

    visit root_path

    expect(page).to have_content recipe[0].name
    expect(page).to have_content recipe[0].preference.name
    expect(page).to have_content recipe[0].food_type.name
    expect(page).to have_content recipe[0].kitchen.name
    expect(page).to have_content recipe[0].difficulty

    expect(page).to have_content recipe[1].name
    expect(page).to have_content recipe[2].name

    expect(page).to_not have_content recipe_old[0].name
    expect(page).to_not have_content recipe_old[1].name
    expect(page).to_not have_content recipe_old[2].name

    expect(page).to have_content recipe_favorites[0].name
    expect(page).to have_content recipe_favorites[0].preference.name
    expect(page).to have_content recipe_favorites[0].food_type.name
    expect(page).to have_content recipe_favorites[0].kitchen.name
    expect(page).to have_content recipe_favorites[0].difficulty

    expect(page).to have_content recipe_favorites[1].name
    expect(page).to have_content recipe_favorites[2].name
    # expect(page).to have_css("img[src*='no-photo.jpg']")
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
