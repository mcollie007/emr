# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# patient_params = {first_name: 'Mary', middle_name: 'Sue', last_name: 'Lamb', mr: 'SB1000101', dob: '1979-05-04', gender: 1}
# p = Patient.create(patient_params)
# a = p.create_admission(moment: Time.zone.now)
# a.diagnoses.create(coding_system: 'ICD-10', code: 'A029', description: "Salmonella infection, unspecified", patient_id: 1)
# a.symptoms.create(description: 'nausea')
# a.symptoms.create(description: 'vomiting')
# a.observations.create(description: 'increased sweating', moment: 'Time.zone.now')
# a.observations.create(description: 'increased stomach pain', moment: 'Time.zone.now')
# p.allergies.create!(description: 'peanuts')
# p.allergies.create!(description: 'shellfish')
# p.medications.create!(name: 'Aspirin', dosage: 2.0, necessity: "Headaches", mass_unit: 0, medication_route: 0)
# p.medications.create!(name: 'Imodium AD', dosage: 1.0, necessity: "Loose Stool", mass_unit: 0, medication_route: 0)
# p.medications.first.create_order_frequency(value: 'q4', frequency_unit: 0)
# p.medications.second.create_order_frequency(value: 'q6', frequency_unit: 0)
# p.diagnostic_procedures.create!(description: "Lab test of stool", moment: Time.now.zone)
# p.treatments.create!(description: "Bed rest", necessity: "to relieve pain")
# p.treatments.create!(description: "Cold compress to forehead", necessity: "to relieve pain")
4.times do
  Facility.create(name: Faker::Company.name)
end

10.times do
  moment = Time.zone.now
  patient_params = {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    middle_name: Faker::Name.first_name,
    dob: Faker::Date.birthday(min_age: 18, max_age: 99),
    gender: [0,1,2].sample,
    mr: "SB#{Random.rand(99999999)}"
  }
  ActiveRecord::Base.transaction do
    patient = Patient.create(patient_params)
    admission = patient.create_admission(moment: moment)

    3.times do
      admission.tap do |a|
        a.diagnoses.create(coding_system: "ICD-10",
                           code: "#{Faker::Lorem.word[0...3]}#{Random.rand(999)}",
                           description: Faker::Lorem.word)
        a.symptoms.create(description: ["nausea", "vomiting", "sweating"].sample)
        a.observations.create(description: Faker::Lorem.word)
      end
    end

    2.times do
      patient.tap do |p|
        p.allergies.create(description: ["peanuts", "shellfish", "cats", "dogs", "flowers"].sample)
        p.diagnostic_procedures.create(description: ["Lab test of blood", "MRI", "CT Scan", "Ultrasound", "Xray"].sample, moment: moment)
        p.treatments.create(description: ["bed rest", "elevation", "medicated", "restricted movement"].sample, necessity: "to relieve pain")
        p.diagnoses.create(coding_system: "ICD-10",
                           code: "#{Faker::Lorem.word[0...3]}#{Random.rand(999)}",
                           description: Faker::Lorem.word)
        p.chronic_conditions.create(coding_system: "ICD-10",
                                    code: "#{Faker::Lorem.word[0...3]}#{Random.rand(999)}",
                                    description: Faker::Lorem.word)
        medication = p.medications.create(name: Faker::Lorem.word, dosage: Random.rand(9),
                                           necessity: Faker::Lorem.word, mass_unit: 0,
                                           medication_route: [0,1,2].sample)
        medication.create_order_frequency(value: "q#{Random.rand(9)}", frequency_unit: 0)
      end
    end
  end
end
