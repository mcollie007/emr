FactoryBot.define do
  factory :patient do
    first_name  { Faker::Name.first_name }
    last_name   { Faker::Name.last_name }
    middle_name { Faker::Name.first_name }
    dob         { Faker::Date.birthday(min_age: 18, max_age: 99) }
    gender      { [0,1,2].sample }
    mr          { "SB#{Random.rand(99999999)}" }
  end
end
