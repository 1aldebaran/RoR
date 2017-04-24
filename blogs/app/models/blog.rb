class Blog < ActiveRecord::Base
  validates :name, :description, presence: true
  has_many :posts, dependent: :destroy
  has_many :owners
  has_many :users, through: :owners
  has_many :user_posts, through: :posts, source: :user
end
