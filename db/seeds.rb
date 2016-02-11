User.create(name: 'admin', email: 'admin@email.com', password: '12345687',
            admin: true, slug: 'admin')
user = User.create(name: 'First user', email: 'user@email.com',
                   password: '12345687', slug: 'first-user')
5.times do |n|
  kitchen = Kitchen.create(name: "FoodType #{n}", slug: "foodtype-#{n}")
  preference = Preference.create(name: "Preference #{n}", slug: "preference-#{n}")
  food = FoodType.create(name: "Kitchen #{n}", slug: "kitchen-#{n}")

  Recipe.create(name: "Recipe #{n}", kitchen:kitchen, food_type:food,
                preference:preference, serves: '10', time:'60',
                difficulty: 'Easy', user: user, slug: "recipe-#{n}")
end
