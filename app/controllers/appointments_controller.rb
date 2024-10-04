class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :destroy]
  before_action :set_medical_care, only: [:index]  # Si tu veux filtrer par MedicalCare

  # GET /appointments
  # Affiche tous les rendez-vous de l'utilisateur connecté et d'un MedicalCare spécifique
   # GET /appointments
   def index
    @appointments = current_user.appointments
    puts "Current User: #{current_user.email}"  # Pour afficher l'utilisateur connecté
    puts "Appointments: #{@appointments.inspect}"  # Pour afficher les rendez-vous
  end

  def show
    # L'instance @appointment est déjà définie par le before_action :set_appointment
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path, notice: 'Appointment was successfully canceled.', status: :see_other
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to appointments_path, alert: "Appointment not found."
  end

  # Ajoute cette méthode pour filtrer par MedicalCare si nécessaire
  def set_medical_care
    if params[:medical_care_id]
      @medical_care = MedicalCare.find(params[:medical_care_id])
    end
  end
end
