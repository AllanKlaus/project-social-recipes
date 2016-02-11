require 'rails_helper'

describe 'Recipe model' do
  context 'save slug' do
    it 'do slug' do
      preference = create(:preference)
      expect(preference.slug).to eq to_slug(preference.name)
    end

    it "make sure that slug don't change on update" do
      preference = create(:preference)
      first_slug = preference.slug
      preference.name = FFaker::Name.name
      preference.save
      expect(preference.slug).to eq first_slug
    end

    it 'make sure that slugs are unique' do
      name = FFaker::Name.name
      preference = create_list(:preference, 3, name: name)

      expect(preference[0].slug).to_not eq to_slug(preference[1].slug)
      expect(preference[0].slug).to_not eq to_slug(preference[2].slug)
      expect(preference[1].slug).to_not eq to_slug(preference[2].slug)
    end
  end
end
