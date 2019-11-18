User.create!(name:  "No Negativo",
             email: "no@no.no",
             password:              "nonono",
             password_confirmation: "nonono")

Admin.create!(name:  "santi",
             email: "santi@santi",
             password:              "foulgorpinto",
             password_confirmation: "foulgorpinto")

Maid.create!(name:  "yes positive",
             email: "yes@yes.yes",
             password:              "yesyes",
             password_confirmation: "yesyes")


# Generate a bunch of additional users.
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@email.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@email.com"
  password = "password"
  Maid.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(10)
50.times do
  address = Faker::Lorem.sentence(word_count: 3)
  users.each { |user| user.orders.create!(content: address) }
end