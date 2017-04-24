class Dojo < ActiveRecord::Base
  validates :state, :city, :street, :branch, presence: true, :on => :create
  has_many :students, dependent: :destroy
end
