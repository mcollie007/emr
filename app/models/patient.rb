class Patient < ApplicationRecord
  enum gender: [:male, :female, :other]

  has_one :admission
  has_many :diagnoses, class_name: "Diagnosis", foreign_key: "patient_id"
  has_many :allergies
  has_many :medications, class_name: "MedicationOrder"
  has_many :diagnostic_procedures
  has_many :treatments
  has_many :chronic_conditions, class_name: "Diagnosis", foreign_key: "chronic_condition_id"

  def full_name
    "#{last_name}, #{first_name} #{middle_name.first}."
  end

  def allergies_description
    allergies.map { |a| a.description }.to_sentence
  end

  def chronic_conditions_description
    chronic_conditions.map { |c| "#{c.description} (#{c.code})" }.to_sentence
  end

  def medications_description
    medications.map do |m|
      "#{m.name} #{m.dosage.to_f}#{m.mass_unit} #{m.medication_route} " +
      "#{m.try(:order_frequency).try(:value)}#{m.try(:order_frequency).try(:frequency_unit)} to #{m.necessity}"
    end.to_sentence
  end

  def diagnoses_description
    diagnoses.map{ |d| "#{d.description} (#{d.code})" }.to_sentence
  end

  def treatments_description
    treatments.map { |t| "#{t.description} to #{t.necessity}" }.to_sentence
  end

  def diagnostic_procedures_description
    diagnostic_procedures.map { |p| "#{p.description} on #{p.date} #{p.time}" }.to_sentence
  end

  def patient_summary
    "This #{age} years old #{gender} was admitted to #facility.name} emergency facility on #{admission.date} at #{admission.time} due
    to #{admission.diagnoses_description}. The observed symptoms on admission where #{admission.symptoms_description}.
    #{admission.observations_description.capitalize}. Upon asking about known allergies the patient disclosed #{allergies_description}.
    Upon asking about chronic conditions, the patient disclosed #{chronic_conditions_description}.
    The patient was administered with #{medications_description}. The staff performed #{diagnostic_procedures_description}, revealing #{diagnoses_description}.
    Our team proceeded to #{treatments_description}."
  end

  def age
    ((Time.zone.now - dob.to_time) / 1.year.seconds).floor
  end

  # def pt_summary
  #   "This #{patient.age} years old #{patient.gender} was admitted to #{facility.name} on #{patient.admission.date}
  #   at #{patient.admission.time} due
  #   to #{patient.admission.diagnoses > described_code | to_sentence}.
  #   The observed symptoms on admission were #{patient.admission.symptoms > description | to_sentence}.
  #   #{patient.admission.observations > description | to_sentence}." +
  #   "Upon asking about known allergies, the patient disclosed #{patient.allergies > description | to_sentence}.
  #   Upon asking about chronic conditions, the patient disclosed #{patient.chronic_conditions > described_code | to_sentence}.
  #   The patient was administered with #{patient.medications > name, dosage, route, frequency, 'to', necessity | space_join | to_sentence}."+
  #   "The staff performed #{patient.diagnostic_procedures > description, 'on', moment.date, 'at', moment.time | space_join | to_sentence},
  #   revealing #{patient.diagnoses > described_code | to_sentence}.
  #   Our team proceeded to #{patient.treatments > description, 'to', necessity | space_join | to_sentence}."
  # end
end
