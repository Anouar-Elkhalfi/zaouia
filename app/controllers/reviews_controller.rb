class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy]
  before_action :authorize_owner, only: [:destroy]

  def new
    @medical_care = MedicalCare.find(params[:medical_care_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @medical_care = MedicalCare.find(params[:medical_care_id])
    @review.medical_care = @medical_care
    @review.user = current_user # Associe la review à l'utilisateur actuel

    if @review.save
      redirect_to medical_care_path(@medical_care), notice: 'Review was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to medical_care_path(@review.medical_care), status: :see_other, notice: 'Review was successfully deleted.'
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def authorize_owner
    unless @review.user == current_user
      redirect_to medical_care_path(@review.medical_care), alert: 'You are not authorized to delete this review.'
    end
  end
end

