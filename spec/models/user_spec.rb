require 'rails_helper'

describe 'User send mail' do
  context 'user send recipe' do
    it 'send a recipe' do
      user = create(:user)
      recipe = create(:recipe)
      friend = { name: 'Klaus', mail: 'allan_klaus@globo.com',
                 subject: I18n.t('mail.subject.send_recipe'),
                 message: FFFaker::Lorem.paragraph(2) }
      expect { user.send_recipe(user, recipe, friend) }.to
      change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
