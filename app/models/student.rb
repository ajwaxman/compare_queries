class Student < ActiveRecord::Base
  belongs_to :classroom
  attr_accessible :age, :name
end
