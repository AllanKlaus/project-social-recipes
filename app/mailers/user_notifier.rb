class UserNotifier < ApplicationMailer
  def send_recipe(user, recipe, friend)
    @name = user.name
    @recipe = recipe

    @friend_name = friend[:name]
    @message = friend[:message]
    mail to: friend[:mail], subject: friend[:subject]
  end
end
