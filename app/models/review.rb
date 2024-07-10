class Review < ApplicationRecord
  belongs_to :medical_care


  validates :content, presence: true
end
