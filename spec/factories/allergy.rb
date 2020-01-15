FactoryBot.define do
  factory :allergy do
    association(:patient)
    description { Faker::Lorem.word }
  end
end
