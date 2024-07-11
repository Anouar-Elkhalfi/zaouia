class MedicalCare < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # Validations
  validates :name, presence: true
  validates :address, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :phone, presence: true, format: { with: /\A(\+212[0-9]{9}|0[5-7][0-9]{8})\z/, message: "must be in the format +212XXXXXXXXX or 0XXXXXXXXX" }
end
