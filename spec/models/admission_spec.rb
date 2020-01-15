require 'rails_helper'

RSpec.describe Admission, type: :model do
  let!(:time_moment) { Time.zone.now }

  before do
    Timecop.freeze(time_moment)
  end

  it { should have_many :diagnoses }

  it { should have_many :symptoms }

  it { should have_many :observations}

  describe "#admission" do
    let(:patient) { create(:patient, gender: 1) }
    let(:admission) { create(:admission, moment: time_moment, patient: patient) }
    let(:diagnoses) { [] }
    let(:symptoms) { [] }
    let(:observations) { [] }

    context "#diagnoses_description" do
      context "diagnoses is empty" do
        it "returns an empty string" do
          expect(admission.diagnoses_description).to be_empty
        end
      end

      context "diagnoses is not empty" do
        before do
          3.times do
            create(:diagnosis, admission_id: admission.id)
          end
        end

        it "returns a list of diagnoses in a sentence" do
          expect(admission.diagnoses_description).not_to be_empty
        end
      end
    end

    context "#symptoms_description" do
      context "symptoms is empty" do
        it "returns an empty string" do
          expect(admission.symptoms_description).to be_empty
        end
      end

      context "symptoms is not empty" do
        before do
          3.times do
            create(:symptom, admission: admission)
          end
        end

        it "returns a list of symptoms in a sentence" do
          expect(admission.symptoms_description).not_to be_empty
        end
      end
    end

    context "#observations_description" do
      context "observations is empty" do
        it "returns an empty string" do
          expect(admission.observations_description).to be_empty
        end
      end

      context "observations is not empty" do
        before do
          3.times do
            create(:observation, admission: admission)
          end
        end

        it "returns a list of observations in a sentence" do
          expect(admission.observations_description).not_to be_empty
        end
      end
    end
  end
end
