class ReviewsController < ApplicationController
  def new
    # We need @medicalcare in our `simple_form_for`
    @medicalcare = MedicalCare.find(params[:medical_care_id])
    @review = Review.new
  end
  def create
    #construire la review avec le content
    @review = Review.new(review_params)
    raise
    # trouver le medical care
    @medicalcare = MedicalCare.find(params[:medical_care_id])
    # associer la review avec le medical care


  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

end
