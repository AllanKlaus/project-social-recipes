require 'rails_helper'

feature 'User access another user profile' do
  scenario 'successfully' do
    user = create(:user)
    recipe = create_list(:recipe, 5, user: user)

    visit user_path(user)

    expect(page).to have_content user.name
    expect(page).to have_content user.city
    expect(page).to have_content user.uf
    expect(page).to have_content recipes[0].name
    expect(page).to have_content recipes[4].name
  end
end
