class User < ApplicationRecord
  # Devise inclus si tu l'utilises
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Méthode pour vérifier le rôle 'admin'
  def admin?
    role == 'admin'
  end

  # Méthode pour vérifier le rôle 'doctor'
  def doctor?
    role == 'doctor'
  end

  # Méthode pour vérifier le rôle 'patient'
  def patient?
    role == 'patient'
  end
end
