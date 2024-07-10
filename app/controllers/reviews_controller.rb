class ReviewsController < ApplicationController
  def new
    # We need @medicalcare in our `simple_form_for`
    @medical_care = MedicalCare.find(params[:medical_care_id])
    @review = Review.new
  end
  def create
    #construire la review avec le content
    @review = Review.new(review_params)
    # trouver le medical care
    @medical_care = MedicalCare.find(params[:medical_care_id])
    # associer la review avec le medical care
    @review.medical_care = @medical_care
    # save the review
    if @review.save
    redirect_to medical_care_path(@medical_care), notice: 'Review was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end
  def destroy
    @review = Review.find(params[:id])
    # @medical_care = @review.medical_care
    @review.destroy
    redirect_to medical_care_path(@review.medical_care), status: :see_other,notice: 'Review was successfully deleted.'
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

end
