class User < ApplicationRecord
  has_secure_password
  #------------------------------- Validations --------------------------------
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  #------------------------------ Associations --------------------------------
  has_many :posts, dependent: :destroy
  has_many :comments
  
end
