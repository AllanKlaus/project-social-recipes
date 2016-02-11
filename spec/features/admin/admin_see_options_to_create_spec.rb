require 'rails_helper'

feature 'Admin see options' do
  scenario 'Admin see menu with admin option' do
    login_admin
    visit root_path
    expect(page).to have_content I18n.t('generic.menu.admin_options')
    expect(page).to have_content I18n.t('generic.menu.create_kitchen')
    expect(page).to have_content I18n.t('generic.menu.create_preference')
    expect(page).to have_content I18n.t('generic.menu.create_foot_type')
  end

  scenario 'User dont see menu with admin option' do
    login
    visit root_path
    expect(page).to_not have_content I18n.t('generic.menu.admin_options')
  end

  scenario 'Admin see edit kitchen option' do
    login_admin
    visit kitchen_path(create(:kitchen))
    expect(page).to have_content I18n.t('generic.edit')
  end

  scenario 'Admin see edit preference option' do
    login_admin
    visit preference_path(create(:preference))
    expect(page).to have_content I18n.t('generic.edit')
  end

  scenario 'Admin see edit food type option' do
    login_admin
    visit food_type_path(create(:food_type))
    expect(page).to have_content I18n.t('generic.edit')
  end
end
