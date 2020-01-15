class DiagnosticProcedure < ApplicationRecord
  belongs_to :patient
  validates :moment, presence: true
  validates :description, presence: true

  def date
    moment.strftime("%B %d, %Y")
  end

  def time
    moment.strftime("%H:%M %p")
  end
end
