FactoryBot.define do
  factory :diagnosis do
    coding_system { "ICD-10" }
    sequence(:code) { |n| "#{Faker::Lorem.word[0...3]}#{n}" }
    sequence(:description) { |n| Faker::Company.bs }
  end

  factory :chronic_condition, class: Diagnosis do
    coding_system { "ICD-10" }
    sequence(:code) { |n| "#{Faker::Lorem.word[0...3]}#{n}" }
    sequence(:description) { |n| Faker::Company.bs }
  end
end
