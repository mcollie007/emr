require 'rails_helper'

RSpec.describe DiagnosticProcedure, type: :model do
  it { should belong_to :patient }
end
