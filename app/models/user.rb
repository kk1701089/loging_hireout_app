class User < ApplicationRecord
  has_secure_password

  # hostモデルと結びつける
  has_many :hosts
  
  # rentalモデルと結びつける
  has_many :rentals
  
  validates :name, presence:true
  validates :email,presence:true,uniqueness: true
end
