class MedicalCaresController < ApplicationController
  # Action index pour afficher toutes les instances de MedicalCare
  def index
    # @medical_cares est une collection (toutes les instances de MedicalCare)
    @medical_cares = MedicalCare.all
  end
 # Action show pour afficher une seule instance de MedicalCare
  def show
    # @medical_care est une seule instance de MedicalCare, trouvée par son ID
    @medical_care = MedicalCare.find(params[:id])
  end

  def new
    @medical_care = MedicalCare.new
  end

  def create
    @medical_care = MedicalCare.new(medical_care_params)
    @medical_care.save
    redirect_to medical_care_path(@medical_care)
  end
  private

  def medical_care_params
    params.require(:medical_care).permit(:name, :adress, :rating, :phone)
  end
end
