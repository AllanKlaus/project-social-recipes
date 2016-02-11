class Preference < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :recipes, dependent: :destroy
  validates :name, presence: true
end
