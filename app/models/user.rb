class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes
  has_many :favorites
  has_and_belongs_to_many :kitchens

  validates :name, :email, presence: true

  def send_recipe(user, recipe, friend)
    # byebug
    UserNotifier.send_recipe(user, recipe, friend).deliver_now
  end
end
