class ApplicationDecorator < Draper::Decorator
  include Rails.application.routes.url_helpers

  protected

  def link_edit(path, css = 'btn btn-primary')
    h.link_to h.t('generic.edit'), path, class: css
  end

  def link_delete(model, css = 'btn btn-primary')
    h.link_to h.t('generic.delete'), model, method: :delete, class: css
  end

  def link_to(text, path, id = nil, css = 'btn btn-primary')
    h.link_to text, path, id: id, class: css
  end
end
