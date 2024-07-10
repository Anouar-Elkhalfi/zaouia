class MedicalCare < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
