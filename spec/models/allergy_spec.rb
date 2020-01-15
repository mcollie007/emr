require 'rails_helper'

RSpec.describe Allergy, type: :model do
  it { should belong_to :patient }
end
