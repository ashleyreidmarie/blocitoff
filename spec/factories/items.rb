FactoryGirl.define do
  factory :item do
    name {Faker::Space.star}
    user
  end
end
