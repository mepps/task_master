class Task < ActiveRecord::Base
  belongs_to :goal
  attr_accessible :how, :what, :where
end
