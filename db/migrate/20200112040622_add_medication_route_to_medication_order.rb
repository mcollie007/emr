class AddMedicationRouteToMedicationOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :medication_orders, :medication_route, :integer
  end
end
