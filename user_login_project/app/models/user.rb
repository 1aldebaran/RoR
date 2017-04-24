class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email_address, :age, presence: true
  validates :first_name, :last_name, length: { in: 2..20 }
  validates :email_address, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 10, less_than_or_equal_to: 150  }

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  def self.average_age
      self.sum(:age) / self.count
  end
end
