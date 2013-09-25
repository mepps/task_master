class Goal < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date, :goal
  has_many :tasks
end
