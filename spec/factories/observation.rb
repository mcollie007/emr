FactoryBot.define do
  factory :observation do
    association(:admission)
    description { Faker::Company.bs }
  end
end
