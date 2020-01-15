class CreateTreatments < ActiveRecord::Migration[6.0]
  def change
    create_table :treatments do |t|
      t.text :description
      t.text :necessity
      t.references :patient

      t.timestamps
    end
  end
end
