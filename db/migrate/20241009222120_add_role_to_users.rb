class AddRoleToUsers < ActiveRecord::Migration[7.1]
  def change
    # Ajoute une colonne 'role' avec la valeur par défaut 'patient'
    add_column :users, :role, :string, default: "patient", null: false

    # Ajoute un index sur le champ 'role' pour optimiser les recherches par rôle
    add_index :users, :role
  end
end

