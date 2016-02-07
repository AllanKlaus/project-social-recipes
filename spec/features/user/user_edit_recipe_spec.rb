require 'rails_helper'

feature 'User edit his recipe' do
  scenario 'successfully' do
    user = login

    recipe = create(:recipe, user: user)
    recipe_new = build(:recipe, user: user)

    visit edit_recipe_path(recipe)

    fill_in 'recipe[name]',           with: recipe_new.name
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

    expect(page).to have_content recipe_new.name
    expect(page).to_not have_content recipe.name
  end

  scenario 'user unlogger' do
    recipe = create(:recipe)
    visit edit_recipe_path(recipe)
    expect(page).to have_content I18n.t('generic.login')
  end

  scenario "unsuccessfully, user try to edit a job that don't belong to him" do
    login

    recipe = create(:recipe)

    visit edit_recipe_path(recipe)

    expect(current_path).to eq my_recipes_path
  end
end
