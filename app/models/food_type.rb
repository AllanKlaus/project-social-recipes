class FoodType < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :recipes
  validates :name, presence: true
end
