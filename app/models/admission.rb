class Admission < ApplicationRecord

  belongs_to :patient
  has_many :diagnoses, class_name: "Diagnosis", foreign_key: "admission_id"
  has_many :symptoms
  has_many :observations

  validates :moment, presence: true

  def date
    moment.strftime("%B %d, %Y")
  end

  def time
    moment.strftime("%H:%M %p")
  end

  def diagnoses_description
    diagnoses.map{ |d| "#{d.description} (#{d.code})" }.to_sentence
  end

  def symptoms_description
    symptoms.map{ |s| "#{s.description}" }.to_sentence
  end

  def observations_description
    observations.map{ |o| "#{o.description}" }.to_sentence
  end
end
