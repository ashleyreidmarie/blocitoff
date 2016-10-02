#Seed Users
10.times do
    name = Faker::Name.first_name
    User.create!(
        name: name,
        email: Faker::Internet.safe_email(name),
        password: Faker::Internet.password(6, 15)
        )
end

#Test user
User.create!(
    email: "ashleyreidmarie@gmail.com",
    password: "helloworld",
    name: "Ashley"
    )
    
users = User.all


#Seed Items
100.times do
    Item.create!(
        name: Faker::Educator.course,
        user: users.sample
        )
end



puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
