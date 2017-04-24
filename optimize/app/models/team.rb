class Team < ActiveRecord::Base
  validates :name, :stadium, :mascot, presence: true

  has_many :players, dependent: :destroy
end
