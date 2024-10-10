class MedicalCaresController < ApplicationController
  before_action :set_medical_care, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! # S'assurer que l'utilisateur est connecté
  before_action :authorize_doctor_or_admin, only: [:new, :create]
  before_action :authorize_owner_or_admin, only: [:edit, :update, :destroy]

  # Action index pour afficher toutes les instances de MedicalCare
  def index
    @medical_cares = MedicalCare.all
  end

  # Action show pour afficher une seule instance de MedicalCare
  def show
  end

  def new
    @medical_care = MedicalCare.new
  end

  def create
    @medical_care = current_user.medical_cares.build(medical_care_params) # Assigner l'utilisateur actuel en tant que propriétaire
    if @medical_care.save
      redirect_to medical_care_path(@medical_care), notice: 'Medical Care was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @medical_care.update(medical_care_params)
      redirect_to medical_care_path(@medical_care), notice: 'Medical Care was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @medical_care.destroy
    redirect_to medical_cares_path, status: :see_other, notice: 'Medical Care was successfully destroyed.'
  end

  private

  # Ajout des nouveaux champs dans le formulaire de saisie
  def medical_care_params
    params.require(:medical_care).permit(:name, :rating, :address, :phone, :specialty, :tarif, :payment_methods, :services, :presentation, :qualifications, :hours)
  end

  def set_medical_care
    @medical_care = MedicalCare.find(params[:id])
  end

  # Autoriser uniquement les administrateurs ou les médecins à créer un MedicalCare
  def authorize_doctor_or_admin
    unless current_user.admin? || current_user.doctor?
      redirect_to medical_cares_path, alert: 'You are not authorized to perform this action.'
    end
  end

  # Vérifier que l'utilisateur est soit l'admin, soit le propriétaire du MedicalCare
  def authorize_owner_or_admin
    unless current_user.admin? || @medical_care.user == current_user
      redirect_to medical_cares_path, alert: 'You are not authorized to modify or delete this Medical Care.'
    end
  end
end
