FactoryBot.define do
  factory :medication_order do
    association(:patient)
    mass_unit         { 0 }
    medication_route  { [0,1,2].sample }
    name              { Faker::Lorem.word }
    dosage            { Random.rand(9) }
    necessity         { Faker::Lorem.word }
  end
end
