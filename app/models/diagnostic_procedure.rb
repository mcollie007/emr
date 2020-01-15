class DiagnosticProcedure < ApplicationRecord
  belongs_to :patient

  def date
    moment.strftime("%B %d, %Y")
  end

  def time
    moment.strftime("%H:%M %p")
  end
end
