class MedicalCare < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # Validations
  validates :name, presence: true
  validates :address, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :phone, presence: true
end
