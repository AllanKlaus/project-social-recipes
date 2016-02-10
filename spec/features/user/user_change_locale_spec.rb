require 'rails_helper'

feature 'User change locale' do
  scenario 'User see system in default language' do
    visit root_path
    expect(page).to have_content 'Social Recipes'
  end

  scenario 'User change locale of system to pt' do
    visit root_path
    click_on 'change_to_pt'
    expect(page).to have_content 'Receita Social'
  end
end
