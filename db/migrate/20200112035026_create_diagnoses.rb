class CreateDiagnoses < ActiveRecord::Migration[6.0]
  def change
    create_table :diagnoses do |t|
      t.string :coding_system
      t.string :code
      t.text   :description
      t.references :patient
      t.references :admission
      t.references :chronic_condition

      t.timestamps
    end
  end
end
