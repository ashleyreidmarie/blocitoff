FactoryGirl.define do
  pw = Faker::Internet.password(8)
  
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password pw
    password_confirmation pw
  end
  
end
