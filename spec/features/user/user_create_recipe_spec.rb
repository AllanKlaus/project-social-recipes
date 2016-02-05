require 'rails_helper'

feature 'User create a recipe' do
  scenario 'successfully' do
    login

    recipe = create(:recipe)

    visit new_recipe_path

    fill_in 'recipe[name]',           with: recipe.name
    select recipe.kitchen.name,       from: 'recipe[kitchen_id]'
    select recipe.food_type.name,     from: 'recipe[food_type_id]'
    select recipe.preference.name,    from: 'recipe[preference_id]'
    fill_in 'recipe[serves]',         with: recipe.serves
    fill_in 'recipe[time]',           with: recipe.time
    choose  'recipe_difficulty_easy'
    fill_in 'recipe[ingredients]',    with: recipe.ingredients
    fill_in 'recipe[steps]',          with: recipe.steps
    page.attach_file('recipe[photo]',
                     Rails.root + 'app/assets/images/no-photo.jpg')

    click_on 'submit'

    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.kitchen.name
    expect(page).to have_content recipe.food_type.name
    expect(page).to have_content recipe.preference.name

    expect(page).to have_content recipe.serves
    expect(page).to have_content recipe.time
    expect(page).to have_content recipe.difficulty
    expect(page).to have_content recipe.ingredients
    expect(page).to have_content recipe.steps
    expect(page).to have_css("img[src*='no-photo.jpg']")
  end

  scenario 'user unlogger' do
    visit new_recipe_path
    expect(page).to have_content 'Log'
  end

  scenario 'unsuccessfully, blank fields' do
    login

    visit new_recipe_path

    click_on 'submit'

    expect(current_path).to eq new_recipe_path
    expect(page).to have_content "can't be blank"
  end
end
