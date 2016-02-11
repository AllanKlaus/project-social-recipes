module ApplicationHelper
  def set_recipe_search
    Recipe.new
  end

  def user_admin?
    current_user.admin if user_signed_in?
  end
end
