class Kitchen < ActiveRecord::Base
  has_many :recipes
  has_and_belongs_to_many :users
  validates :name, presence: true
end
