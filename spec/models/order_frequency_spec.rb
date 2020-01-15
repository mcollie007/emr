require 'rails_helper'

RSpec.describe OrderFrequency, type: :model do
  it { should belong_to :medication_order }
end
