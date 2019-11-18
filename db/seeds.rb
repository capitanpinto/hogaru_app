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
20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@email.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@email.com"
  password = "password"
  Maid.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(10)
now= Time.now + 60 * 60 * 24
year_ahead= now + 60 * 60 * 24 * 3600

  users.each do |user|
        location = Faker::Lorem.sentence(word_count: 3)
        order=user.orders.create!(paid: false)
        15.times do |n|
            maid=rand(1..19)
            meet = rand(now..year_ahead)
            while meet.wday == 0
            meet = rand(now..year_ahead)
            end
            meet = meet.strftime("%Y-%m-%d")
            user.services.create!(meeting_time: meet, 
                                 order_id: order.id,
                                 address: location,
                                 maid_id: maid)
        end
  end
  