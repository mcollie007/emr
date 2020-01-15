class AddMassUnitToMedicationOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :medication_orders, :mass_unit, :integer
  end
end
