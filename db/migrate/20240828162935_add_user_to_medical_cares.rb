class AddUserToMedicalCares < ActiveRecord::Migration[7.1]
  def change
    # Ajouter la colonne user_id sans contrainte null
    add_reference :medical_cares, :user, foreign_key: true
  end
end
