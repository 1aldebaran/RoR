class Like < ActiveRecord::Base
  validates :user, :secret, presence: true
  validates :user, uniqueness: {scope: :secret, message: "You have already liked this secret"}
  belongs_to :user
  belongs_to :secret
end
