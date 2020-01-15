require 'rails_helper'

RSpec.describe Patient, type: :model do
  let(:patient) { create(:patient, gender: 1) }
  let(:treatment) { [] }
  let(:medication_order) { [] }
  let(:diagnosis) { [] }
  let(:chronic_condition) { [] }
  let(:allergy) { [] }
  let(:diagnostic_procedure) { [] }

  it { should have_many :allergies }
  it { should have_many :diagnoses }
  it { should have_one :admission }
  it { should have_many :treatments }
  it { should have_many :diagnostic_procedures }
  it { should have_many(:medications).class_name('MedicationOrder') }
  it { should have_many(:chronic_conditions).class_name("Diagnosis") }

  describe "#create" do
    context "creates the patient with the correct data" do
      it "returns gender name" do
        expect(patient.gender).to eq("female")
      end
    end
  end

  describe "#patient" do
    context "#full_name" do
      it "returns patient full_name" do
        patient_temp_full_name = "#{patient.last_name}, #{patient.first_name} #{patient.middle_name.first}."

        expect(patient.full_name).to eq(patient_temp_full_name)
      end
    end
    context "#diagnoses_description" do
      context "diagnoses is empty" do
        it "returns an empty string" do
          expect(patient.diagnoses_description).to be_empty
        end
      end

      context "diagnoses is not empty" do
        before do
          3.times do
            create(:diagnosis, patient_id: patient.id)
          end
        end

        it "returns a list of diagnoses in a sentence" do
          expect(patient.diagnoses_description).not_to be_empty
        end
      end
    end

    context "#allergies_description" do
      context "allergies is empty" do
        it "returns an empty string" do
          expect(patient.allergies_description).to be_empty
        end
      end

      context "allergies is not empty" do
        before do
          3.times do
            create(:allergy, patient: patient)
          end
        end

        it "returns a list of allergies in a sentence" do
          expect(patient.allergies_description).not_to be_empty
        end
      end
    end

    context "#chronic_conditions_description" do
      context "chronic_conditions is empty" do
        it "returns an empty string" do
          expect(patient.chronic_conditions_description).to be_empty
        end
      end

      context "chronic_conditions is not empty" do
        before do
          3.times do
            create(:chronic_condition, chronic_condition_id: patient.id)
          end
        end

        it "returns a list of chronic_conditions in a sentence" do
          expect(patient.chronic_conditions_description).not_to be_empty
        end
      end
    end

    context "#treatments_description" do
      context "treatments is empty" do
        it "returns an empty string" do
          expect(patient.treatments_description).to be_empty
        end
      end

      context "treatments is not empty" do
        before do
          3.times do
            create(:treatment, patient: patient)
          end
        end

        it "returns a list of treatments in a sentence" do
          expect(patient.treatments_description).not_to be_empty
        end
      end
    end

    context "#diagnostic_procedures_description" do
      context "diagnostic_procedures is empty" do
        it "returns an empty string" do
          expect(patient.diagnostic_procedures_description).to be_empty
        end
      end

      context "diagnostic_procedures is not empty" do
        let(:time_moment) { Time.zone.now }

        before do
          Timecop.freeze(time_moment)
          3.times do
            create(:diagnostic_procedure, patient: patient, moment: time_moment)
          end
        end

        it "returns a list of diagnostic_procedures in a sentence" do
          expect(patient.diagnostic_procedures_description).not_to be_empty
        end
      end
    end

    context "#medications_description" do
      context "medications is empty" do
        it "returns an empty string" do
          expect(patient.medications_description).to be_empty
        end
      end

      context "medications is not empty" do
        before do
          3.times do
            create(:medication_order, patient: patient).tap do |m|
              create(:order_frequency, medication_order: m)
            end
          end
        end

        it "returns a list of medications in a sentence" do
          expect(patient.medications_description).not_to be_empty
        end
      end
    end
  end
end
