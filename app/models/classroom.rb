class Classroom < ActiveRecord::Base
  has_many :students
  attr_accessible :name
end
