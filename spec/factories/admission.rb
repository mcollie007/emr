FactoryBot.define do
  factory :admission do
    association(:patient)
  end
end
