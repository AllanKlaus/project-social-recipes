require 'rails_helper'

describe 'User model' do
  context 'user send recipe' do
    it 'send a recipe' do
      user = create(:user)
      recipe = create(:recipe)
      friend = { name: 'Klaus', mail: 'allan_klaus@globo.com',
                 subject: I18n.t('mail.subject.send_recipe'),
                 message: FFaker::Lorem.paragraph(2) }
      expect { user.send_recipe(user, recipe, friend) }.to change {
        ActionMailer::Base.deliveries.count
      }.by(1)
    end
  end

  context 'save slug' do
    it 'do slug' do
      user = create(:user)
      expect(user.slug).to eq to_slug(user.name)
    end

    it "make sure that slug don't change on update" do
      user = create(:user)
      first_slug = user.slug
      user.update(name: FFaker::Name::name)
      expect(user.slug).to eq first_slug
    end

    it 'make sure that slugs are unique' do
      name = FFaker::Name::name
      user = create_list(:user, 3, name: name)

      expect(user[0].slug).to_not eq to_slug(user[1].slug)
      expect(user[0].slug).to_not eq to_slug(user[2].slug)
      expect(user[1].slug).to_not eq to_slug(user[2].slug)
    end
  end
end
