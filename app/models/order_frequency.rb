class OrderFrequency < ApplicationRecord
 enum frequency_unit: [:hr]

 belongs_to :medication_order
 validates :value, presence: true
end
