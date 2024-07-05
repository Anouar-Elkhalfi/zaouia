class CreateMedicalCares < ActiveRecord::Migration[7.1]
  def change
    create_table :medical_cares do |t|
      t.string :name
      t.integer :rating
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
