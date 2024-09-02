# app/controllers/admin/reviews_controller.rb
module Admin
  class ReviewsController < ApplicationController
    before_action :authorize_admin

    def index
      @reviews = Review.all
    end

    def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to admin_reviews_path, notice: 'Review was successfully deleted.'
    end

    private

    def authorize_admin
      redirect_to root_path, alert: 'Not authorized.' unless current_user.admin?
    end
  end
end
