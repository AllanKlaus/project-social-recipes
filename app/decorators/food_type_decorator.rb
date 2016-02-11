class FoodTypeDecorator < ApplicationDecorator
  delegate_all

  def link_edit
    h.link_to h.t('generic.edit'), edit_food_type_path(model)
  end

end
