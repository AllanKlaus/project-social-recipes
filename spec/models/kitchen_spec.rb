require 'rails_helper'

describe 'Recipe model' do
  context 'save slug' do
    it 'do slug' do
      kitchen = create(:kitchen)
      expect(kitchen.slug).to eq to_slug(kitchen.name)
    end

    it "make sure that slug don't change on update" do
      kitchen = create(:kitchen)
      first_slug = kitchen.slug
      kitchen.name = FFaker::Name.name
      kitchen.save
      expect(kitchen.slug).to eq first_slug
    end

    it 'make sure that slugs are unique' do
      name = FFaker::Name.name
      kitchen = create_list(:kitchen, 3, name: name)

      expect(kitchen[0].slug).to_not eq to_slug(kitchen[1].slug)
      expect(kitchen[0].slug).to_not eq to_slug(kitchen[2].slug)
      expect(kitchen[1].slug).to_not eq to_slug(kitchen[2].slug)
    end
  end
end
