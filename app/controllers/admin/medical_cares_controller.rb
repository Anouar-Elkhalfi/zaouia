# module Admin
#   class MedicalCaresController < ApplicationController
#     before_action :authorize_admin

#     def new
#       @medical_care = MedicalCare.new
#     end

#     def create
#       @medical_care = MedicalCare.new(medical_care_params)
#       @medical_care.user = current_user  # Assigne l'utilisateur courant (l'administrateur) au MedicalCare

#       puts @medical_care.inspect  # Affiche les détails de l'objet dans le terminal

#       if @medical_care.save
#         puts "Medical care saved successfully."  # Message de succès
#         redirect_to admin_medical_care_path(@medical_care), notice: 'Medical care was successfully created.'
#       else
#         puts "Failed to save medical care."  # Message d'échec
#         puts @medical_care.errors.full_messages  # Affiche les erreurs de validation
#         render :new, status: :unprocessable_entity
#       end
#     end


#     def edit
#       puts "Params ID: #{params[:id]}"  # Ajoutez ce debug
#       @medical_care = MedicalCare.find(params[:id])
#     rescue ActiveRecord::RecordNotFound
#       redirect_to medical_cares_path, alert: "Medical care not found."
#     end


#     def update
#       @medical_care = MedicalCare.find(params[:id])
#       puts @medical_care.inspect  # Affiche les détails de l'objet dans le terminal

#       if @medical_care.update(medical_care_params)
#         puts "Medical care updated successfully."  # Message de succès
#         redirect_to medical_care_path(@medical_care), notice: 'Medical care was successfully updated.'
#       else
#         puts "Failed to update medical care."  # Message d'échec
#         puts @medical_care.errors.full_messages  # Affiche les erreurs de validation
#         render :edit, status: :unprocessable_entity
#       end
#     end

#     def destroy
#       @medical_care = MedicalCare.find(params[:id])
#       @medical_care.destroy
#       redirect_to medical_cares_path, status: :see_other, notice: 'Medical care was successfully deleted.'
#     end

#     private

#     def authorize_admin
#       redirect_to root_path, alert: 'Not authorized.' unless current_user.admin?
#     end

#     def medical_care_params
#       params.require(:medical_care).permit(:name, :rating, :address, :phone, :specialty, :tarif,:payment_methods, :services, :presentation, :qualifications, :hours)
#     end
#   end
# end
