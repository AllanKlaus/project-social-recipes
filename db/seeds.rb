User.create(name: 'admin', email: 'admin@email.com', password: '12345687',
            admin: true)
user = User.create(name: 'First user', email: 'user@email.com',
                   password: '12345687')
5.times do |n|
  kitchen = FoodType.create(name: "FoodType #{n}")
  preference = Preference.create(name: "Preference #{n}")
  food = Kitchen.create(name: "Kitchen #{n}")

  Recipe.create(name: "Recipe #{index}", kitchen:kitchen, food_type:food,
                preference:preference, serves: '10', time:'60',
                difficulty: 'Easy', user: user)
end
