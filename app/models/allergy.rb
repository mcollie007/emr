class Allergy < ApplicationRecord
  belongs_to :patient

  validates :description, presence: true
end
