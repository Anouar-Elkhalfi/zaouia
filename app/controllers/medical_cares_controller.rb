class MedicalCaresController < ApplicationController
  before_action :set_medical_care, only: [:show, :edit, :update, :destroy]
  before_action :authorize_owner, only: [:edit, :update, :destroy]

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
    @medical_care = MedicalCare.new(medical_care_params)
    @medical_care.user = current_user # Assign the current user as the owner
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

  def medical_care_params
    params.require(:medical_care).permit(:name, :rating, :address, :phone)
  end

  def set_medical_care
    @medical_care = MedicalCare.find(params[:id])
  end

  def authorize_owner
    unless @medical_care.user == current_user
      redirect_to medical_cares_path, alert: 'You are not authorized to perform this action.'
    end
  end
end
