class Kitchen < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :recipes
  has_and_belongs_to_many :users
  validates :name, presence: true
end
