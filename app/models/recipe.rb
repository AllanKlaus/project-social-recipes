class Recipe < ActiveRecord::Base
  belongs_to :kitchen
  belongs_to :food_type
  belongs_to :preference
  DIFFICULTY = ['Easy', 'Medium', 'Hard']
end
