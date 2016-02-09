require 'rails_helper'

describe 'User send mail' do
  context 'user send recipe' do
    it 'send a recipe' do
      user = create(:user)
      info = { mail: 'allan_klaus@globo.com' }

      expect { user.send_recipe(self, info) }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
