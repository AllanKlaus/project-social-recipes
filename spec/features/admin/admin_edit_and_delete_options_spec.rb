require 'rails_helper'

feature 'Admin edit and delete options' do
  scenario 'Admin edit kitchen' do
    login_admin
    kitchen = create(:kitchen)
    new_name = FFaker::Name.name
    visit edit_kitchen_path(kitchen)

    fill_in 'kitchen[name]', with: new_name

    click_on 'submit'

    expect(page).to have_content new_name
  end

  scenario 'Admin edit preference' do
    login_admin
    preference = create(:preference)
    new_name = FFaker::Name.name
    visit edit_preference_path(preference)

    fill_in 'preference[name]', with: new_name

    click_on 'submit'

    expect(page).to have_content new_name
  end

  scenario 'Admin edit foot type' do
    login_admin
    food_type = create(:food_type)
    new_name = FFaker::Name.name
    visit edit_food_type_path(food_type)

    fill_in 'food_type[name]', with: new_name

    click_on 'submit'

    expect(page).to have_content new_name
  end
end
