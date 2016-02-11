class FoodTypeDecorator < ApplicationDecorator
  delegate_all

  def link_edit
    super(edit_food_type_path(model))
  end

  def link_delete
    super(model)
  end
end
