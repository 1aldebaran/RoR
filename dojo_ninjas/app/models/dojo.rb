class Dojo < ActiveRecord::Base
  validates :name, :city, :state, presence: true
  validates :name, :city, length: { maximum: 255 }
  validates :state, length: { is: 2 }

  has_many :ninjas

  before_validation :casing
  before_destroy :delete_associated

  private
  def delete_associated
    self.ninjas.each do |ninja|
       ninja.delete
    end
  end
  def casing
    state.upcase!
  end
end
