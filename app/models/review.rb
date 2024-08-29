class Review < ApplicationRecord
  belongs_to :medical_care
  belongs_to :user


  validates :content, presence: true
end
