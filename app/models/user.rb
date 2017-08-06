class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  validates :username, 
            presence: true, 
            uniqueness: { case_sensitive: false }, 
            length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REG = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, 
            presence: true, 
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REG }

  has_secure_password
end
