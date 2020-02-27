# create default user
User.create!(name: "example user", email: "example@example.com" )

9.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  User.create!(name: name, email: email)
end