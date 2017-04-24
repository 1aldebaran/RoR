class Student < ActiveRecord::Base
  validates :first_name, :last_name, :email, :dojo, presence: true, :on => :create
  belongs_to :dojo
end
