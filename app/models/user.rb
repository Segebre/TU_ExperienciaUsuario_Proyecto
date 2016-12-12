class User < ApplicationRecord
  validates :name, :email, :password, :city, :country, :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: { case_sensitive: true }

  has_secure_password

end
