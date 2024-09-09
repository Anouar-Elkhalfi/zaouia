class AddDetailsToMedicalCares < ActiveRecord::Migration[7.1]
  def change
    add_column :medical_cares, :specialty, :string
    add_column :medical_cares, :tarif, :text
    add_column :medical_cares, :payment_methods, :text
    add_column :medical_cares, :services, :text
    add_column :medical_cares, :presentation, :text
    add_column :medical_cares, :qualifications, :text
    add_column :medical_cares, :hours, :text
  end
end
