class Ninja < ActiveRecord::Base
  validates :first_name, :last_name, length: { in: 2..255 }
  validates :first_name, :last_name, presence: true
  belongs_to :dojo
end
