require 'rails_helper'

feature 'User see home organized' do
  scenario 'on home' do
    repeat_times = 5
    food_types = create_list(:food_type, repeat_times)
    kitchens = create_list(:kitchen, repeat_times)
    preferences = create_list(:preference, repeat_times)

    visit root_path

    repeat_times.times do |index|
      expect(page).to have_content food_types[index].name
      expect(page).to have_content kitchens[index].name
      expect(page).to have_content preferences[index].name
    end
  end
end
