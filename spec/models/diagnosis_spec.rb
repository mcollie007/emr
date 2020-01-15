require 'rails_helper'

RSpec.describe Diagnosis, type: :model do
  it { should belong_to :admission }

  it { should belong_to :patient }
end
