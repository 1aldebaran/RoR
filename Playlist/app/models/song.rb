class Song < ActiveRecord::Base
  validates :title, :artist, length: { in: 2..64 }
  has_many :plists, dependent: :destroy
end
