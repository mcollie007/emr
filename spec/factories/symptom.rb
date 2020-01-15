FactoryBot.define do
  factory :symptom do
    association(:admission)
    description { Faker::Company.bs }
  end
end
