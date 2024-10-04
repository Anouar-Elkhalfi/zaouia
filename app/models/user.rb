class User < ApplicationRecord
  # Relation avec les rendez-vous
  has_many :appointments, dependent: :destroy  # <--- cette ligne doit être présente

  # Autres relations et validations
  has_many :medical_cares
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = %w(admin medecin particulier)
  validates :role, inclusion: { in: ROLES }

  # Vérification du rôle administrateur
  def admin?
    self.admin
  end
end
