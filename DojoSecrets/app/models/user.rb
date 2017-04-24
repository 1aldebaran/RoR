class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  a = validates :first_name, :last_name, :email_address, :username, presence: true, on: :create
  if a
    validates :password, length: { in: 8..24 }, on: :create
    validates :first_name, :last_name, :username, length: { in: 2..20 }, on: :create
    validates :email_address, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }, on: :create
  end

  has_secure_password
  has_many :secrets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret
end
