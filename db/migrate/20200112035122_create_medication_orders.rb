class CreateMedicationOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :medication_orders do |t|
      t.string :name
      t.decimal :dosage
      t.text :necessity
      t.references :patient

      t.timestamps
    end
  end
end
