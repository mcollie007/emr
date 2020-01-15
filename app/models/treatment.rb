class Treatment < ApplicationRecord
  belongs_to :patient

  validates :description, presence: true
  validates :necessity, presence: true
end
