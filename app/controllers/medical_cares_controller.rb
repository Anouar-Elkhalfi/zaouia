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
end
