class User < ActiveRecord::Base
  attr_accessible :email_address, :first_name, :last_name, :long_term_goal, :password
  has_secure_password
  validates :email_address, :first_name, :password, presence: true
  validates :email_address, uniqueness: true
  has_many :goals
end
