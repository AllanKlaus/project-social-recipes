require 'rails_helper'

describe 'FoodType model' do
  context 'save slug' do
    it 'do slug' do
      food_type = create(:food_type)
      expect(food_type.slug).to eq to_slug(food_type.name)
    end

    it "make sure that slug don't change on update" do
      food_type = create(:food_type)
      first_slug = food_type.slug
      food_type.name = FFaker::Name.name
      food_type.save
      expect(food_type.slug).to eq first_slug
    end

    it 'make sure that slugs are unique' do
      name = FFaker::Name.name
      food_type = create_list(:food_type, 3, name: name)

      expect(food_type[0].slug).to_not eq to_slug(food_type[1].slug)
      expect(food_type[0].slug).to_not eq to_slug(food_type[2].slug)
      expect(food_type[1].slug).to_not eq to_slug(food_type[2].slug)
    end
  end
end
