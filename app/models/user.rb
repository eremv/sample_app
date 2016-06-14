class User < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 50, minimum: 3}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 50},
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false}
  before_save { self.email = email.downcase}
  validates :password , presence: true, length: {minimum:  6}
  has_secure_password
end
