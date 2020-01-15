class Observation < ApplicationRecord
  belongs_to :admission

  validates :description, presence: true
end
