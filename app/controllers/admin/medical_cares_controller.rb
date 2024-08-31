module Admin
  class MedicalCaresController < ApplicationController
    before_action :authorize_admin

    def new
      @medical_care = MedicalCare.new
    end

    def create
      @medical_care = MedicalCare.new(medical_care_params)
      if @medical_care.save
        redirect_to medical_care_path(@medical_care), notice: 'Medical care was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @medical_care = MedicalCare.find(params[:id])
    end

    def update
      @medical_care = MedicalCare.find(params[:id])
      if @medical_care.update(medical_care_params)
        redirect_to medical_care_path(@medical_care), notice: 'Medical care was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @medical_care = MedicalCare.find(params[:id])
      @medical_care.destroy
      redirect_to medical_cares_path, status: :see_other, notice: 'Medical care was successfully deleted.'
    end

    private

    def authorize_admin
      redirect_to root_path, alert: 'Not authorized.' unless current_user.admin?
    end

    def medical_care_params
      params.require(:medical_care).permit(:name, :rating, :address, :phone)
    end
  end
end
