class AddUserToMedicalCares < ActiveRecord::Migration[7.1]
  def change
    # Add the column without null constraint first
    add_reference :medical_cares, :user, foreign_key: true

    # Then, assign a default user to existing records
    MedicalCare.reset_column_information
    default_user = User.first # Adjust as needed
    MedicalCare.update_all(user_id: default_user.id)

    # Now, add the null constraint
    change_column_null :medical_cares, :user_id, false
  end
end
