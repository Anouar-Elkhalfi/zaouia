class MedicalCaresController < ApplicationController
  def index
    @medical_cares = MedicalCare.all
  end
end
