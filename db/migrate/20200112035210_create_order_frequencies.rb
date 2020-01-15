class CreateOrderFrequencies < ActiveRecord::Migration[6.0]
  def change
    create_table :order_frequencies do |t|
      t.string :value
      t.references :medication_order

      t.timestamps
    end
  end
end
