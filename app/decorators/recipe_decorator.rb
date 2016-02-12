class RecipeDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def link_send_by
    h.content_tag :strong do
      h.t('generic.send_by')
    end
    h.link_to model.user.name, user_path(model.user)
  end

  def photo
    h.image_tag model.photo.url(:thumb)
  end

  def link_add_to_favorite
    link_to(h.t('generic.add_favorite_list'), add_favorite_recipe_path(model),
            'favorite')
  end

  def link_recommend_recipe
    link_to(h.t('generic.recommend_recipe'), recommend_recipe_path(model),
            'recommend')
  end
end
