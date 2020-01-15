class Patient < ApplicationRecord
  enum gender: [:male, :female, :other]

  has_one :admission
  has_many :diagnoses, class_name: "Diagnosis", foreign_key: "patient_id"
  has_many :allergies
  has_many :medications, class_name: "MedicationOrder"
  has_many :diagnostic_procedures
  has_many :treatments
  has_many :chronic_conditions, class_name: "Diagnosis", foreign_key: "chronic_condition_id"

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :middle_name, presence: true
  validates :dob, presence: true
  validates :mr, presence: true

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

  def age
    ((Time.zone.now - dob.to_time) / 1.year.seconds).floor
  end
end
