require 'rails_helper'

RSpec.describe MedicationOrder, type: :model do
  it { should belong_to :patient }
  it { should have_many :order_frequencies }
end
