class UserDecorator < ApplicationDecorator
  delegate_all

  def link_facebook
    unless model.facebook.nil?
      h.content_tag :p do
        h.link_to h.t('generic.facebook'), set_facebook, target: '_blank'
      end
    end
  end

  def link_twitter
    unless model.twitter.nil?
      h.content_tag :p do
        h.link_to h.t('generic.twitter'), set_twitter, target: '_blank'
      end
    end
  end

  private

  def set_facebook
    if model.facebook.index('http').nil?
      "https://www.facebook.com/#{model.facebook}"
    else
      model.facebook
    end
  end

  def set_twitter
    if model.twitter.index('http').nil?
      "https://www.twitter.com/#{model.twitter}"
    else
      model.twitter
    end
  end
end
