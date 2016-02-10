require 'rails_helper'

feature 'User see links to recipe' do
  scenario 'on home' do
    recipe = create(:recipe)

    visit root_path

    click_on recipe.name

    expect(current_path).to eq recipe_path(recipe)
  end

  scenario 'on kitchens path' do
    kitchen = create(:kitchen)
    recipe = create(:recipe, kitchen: kitchen)

    visit kitchen_path(kitchen)

    click_on recipe.name

    expect(current_path).to eq recipe_path(recipe)
  end

  scenario 'on preferences path' do
    preference = create(:preference)
    recipe = create(:recipe, preference: preference)

    visit preference_path(preference)

    click_on recipe.name

    expect(current_path).to eq recipe_path(recipe)
  end

  scenario 'on food types path' do
    food_type = create(:food_type)
    recipe = create(:recipe, food_type: food_type)

    visit food_type_path(food_type)

    click_on recipe.name

    expect(current_path).to eq recipe_path(recipe)
  end

  scenario 'on my recipes path' do
    user = login
    recipe = create(:recipe, user: user)

    visit my_recipes_path

    click_on recipe.name

    expect(current_path).to eq recipe_path(recipe)
  end

  scenario 'on my favorites recipes path' do
    login

    recipe = create(:recipe)
    visit recipe_path(recipe)
    click_on I18n.t('generic.add_favorite_list')

    visit favorite_recipes_path

    click_on recipe.name

    expect(current_path).to eq recipe_path(recipe)
  end
end
