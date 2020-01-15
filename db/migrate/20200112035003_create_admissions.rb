class CreateAdmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :admissions do |t|
      t.datetime :moment
      t.references :patient

      t.timestamps
    end
  end
end
