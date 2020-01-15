class MedicationOrder < ApplicationRecord
  enum mass_unit: [:mg]
  enum medication_route: [:PO, :IM, :SC]

  belongs_to :patient
  has_one :order_frequency

  validates :name, presence: true
  validates :dosage, presence: true
  validates :necessity, presence: true
end
