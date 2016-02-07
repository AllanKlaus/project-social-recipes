class Recipe < ActiveRecord::Base
  belongs_to :kitchen
  belongs_to :food_type
  belongs_to :preference
  belongs_to :user
  has_many   :favorites
  validates :name, :kitchen_id, :food_type_id, :preference_id, :serves, :time,
            :difficulty, :ingredients, :steps, presence: true

  DIFFICULTY = %w(Easy Medium Hard).freeze

  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>' },
                            default_url: '/images/:style/no-photo.jpg'
  validates_attachment_content_type :photo, content_type: %r{\Aimage\/.*\Z}
end
