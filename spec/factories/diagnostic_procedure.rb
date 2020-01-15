FactoryBot.define do
  factory :diagnostic_procedure do
    association(:patient)
    description   { Faker::Company.bs }
  end
end
