class EmergencyTransfer
  attr_reader :facility, :patient

  def initialize(facility, patient)
    @facility = facility
    @patient = patient
  end

  def transfer_summary
    "This #{patient.age} years old #{patient.gender} was admitted to #{facility.name} emergency facility on #{patient.admission.date} at #{patient.admission.time} due
    to #{patient.admission.diagnoses_description}. The observed symptoms on admission where #{patient.admission.symptoms_description}.
    #{patient.admission.observations_description.capitalize}. Upon asking about known allergies the patient disclosed #{patient.allergies_description}.
    Upon asking about chronic conditions, the patient disclosed #{patient.chronic_conditions_description}.
    The patient was administered with #{patient.medications_description}. The staff performed #{patient.diagnostic_procedures_description}, revealing #{patient.diagnoses_description}.
    Our team proceeded to #{patient.treatments_description}."
  end
end
