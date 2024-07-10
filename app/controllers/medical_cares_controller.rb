class MedicalCaresController < ApplicationController
  before_action :set_medical_care, only: [:show, :edit, :update, :destroy]
  # Action index pour afficher toutes les instances de MedicalCare
  def index
    # @medical_cares est une collection (toutes les instances de MedicalCare)
    @medical_cares = MedicalCare.all
  end
 # Action show pour afficher une seule instance de MedicalCare
  def show
    # @medical_care est une seule instance de MedicalCare, trouvée par son ID
  end

  def new
    @medical_care = MedicalCare.new
  end

  def create
    @medical_care = MedicalCare.new(medical_care_params)
    if @medical_care.save
        redirect_to medical_care_path(@medical_care), notice: 'Medical Care was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end
  def update
    @medical_care.update(medical_care_params)
    redirect_to medical_care_path(@medical_care), notice: 'Medical Care was successfully updated.'
  end
  def destroy
    @medical_care.destroy
    redirect_to medical_cares_path, status: :see_other, notice: 'Medical Care was successfully destroyed.'
  end

  private

  def medical_care_params
    params.require(:medical_care).permit(:name,:rating, :address, :phone)
  end
  def set_medical_care
    @medical_care = MedicalCare.find(params[:id])
  end
end
