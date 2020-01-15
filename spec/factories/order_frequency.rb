FactoryBot.define do
  factory :order_frequency do
    association(:medication_order)
    value           { "q#{Random.rand(9)}" }
    frequency_unit  { 0 }
  end
end
