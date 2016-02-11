class PreferenceDecorator < ApplicationDecorator
  delegate_all

  def link_edit
    h.link_to h.t('generic.edit'), edit_preference_path(model)
  end

end
