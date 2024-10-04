class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :medical_care

  validates :date, presence: true
  validates :time, presence: true
end
