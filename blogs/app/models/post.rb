class Post < ActiveRecord::Base
  validates :title, :content, presence: true
  belongs_to :blog
  belongs_to :user
  has_many :messages, dependent: :destroy
end
