class User < ApplicationRecord
  # Devise inclus si tu l'utilises
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Un utilisateur peut avoir plusieurs MedicalCares
  has_many :medical_cares, dependent: :destroy

  # Méthodes de rôle
  def admin?
    role == 'admin'
  end

  def doctor?
    role == 'doctor'
  end

  def patient?
    role == 'patient'
  end
end
