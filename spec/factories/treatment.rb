FactoryBot.define do
  factory :treatment do
    association(:patient)
    description  { Faker::Company.bs }
    necessity    { Faker::Company.bs }
  end
end
