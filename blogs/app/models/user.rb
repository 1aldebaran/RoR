class User < ActiveRecord::Base
  validates :name, :email, presence: true
  has_many :posts, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one :owner
  has_many :blogs, through: :owner
  has_many :blog_posts, through: :posts, source: :blog
end
