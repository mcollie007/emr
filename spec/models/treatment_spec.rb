require 'rails_helper'

RSpec.describe Treatment, type: :model do
  it { should belong_to :patient }
end
