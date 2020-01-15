class Symptom < ApplicationRecord
  belongs_to :admission

  validates :description, presence: true
end
