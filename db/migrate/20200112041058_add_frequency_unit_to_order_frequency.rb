class AddFrequencyUnitToOrderFrequency < ActiveRecord::Migration[6.0]
  def change
    add_column :order_frequencies, :frequency_unit, :integer 
  end
end
