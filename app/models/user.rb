class User < ApplicationRecord
  has_many :medical_cares
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = %w(admin, medecin, particulier)
  validates :role, inclusion: { in: ROLES}

  # Admin check
  def admin?
    self.admin
  end
end
