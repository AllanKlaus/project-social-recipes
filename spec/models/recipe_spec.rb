require 'rails_helper'

describe 'Recipe model' do
  context 'save slug' do
    it 'do slug' do
      recipe = create(:recipe)
      expect(recipe.slug).to eq to_slug(recipe.name)
    end

    it "make sure that slug don't change on update" do
      recipe = create(:recipe)
      first_slug = recipe.slug
      recipe.name = FFaker::Name.name
      recipe.save
      expect(recipe.slug).to eq first_slug
    end

    it 'make sure that slugs are unique' do
      name = FFaker::Name.name
      recipe = create_list(:recipe, 3, name: name)

      expect(recipe[0].slug).to_not eq to_slug(recipe[1].slug)
      expect(recipe[0].slug).to_not eq to_slug(recipe[2].slug)
      expect(recipe[1].slug).to_not eq to_slug(recipe[2].slug)
    end
  end
end
