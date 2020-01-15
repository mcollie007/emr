require 'csv'

namespace :diagnosis do

  task :import_icd10 => :environment do
    puts "started loading icd 10 codes"
    CSV.foreach("#{Rails.root}/lib/ICD10-Jan2020.csv", headers: false) do |row|
      #Diagnosis.create!(coding_system: "ICD 10", code: row[0], description: row[1])
    end
    puts "finished loading icd 10 codes"
  end
end
