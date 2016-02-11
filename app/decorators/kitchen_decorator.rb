class KitchenDecorator < ApplicationDecorator
  delegate_all

  def link_edit
    super(edit_preference_path(model))
  end

  def link_delete
    super(model)
  end
end
