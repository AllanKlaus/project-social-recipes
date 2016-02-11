class ApplicationDecorator < Draper::Decorator
  include Rails.application.routes.url_helpers

  protected

  def link_edit(path)
    h.link_to h.t('generic.edit'), path
  end

  def link_delete(model)
    h.link_to h.t('generic.delete'), model, method: :delete
  end
end
