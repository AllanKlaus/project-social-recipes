class KitchenDecorator < ApplicationDecorator
  delegate_all

  def link_edit
    h.link_to h.t('generic.edit'), edit_kitchen_path(model)
  end

end
