class Classroom < ActiveRecord::Base
  has_many :students
  attr_accessible :name

  def self.query_with_select(age)
   classrooms_with_student_age_x = self.all.select do |classroom|
      student_age_x = false
      classroom.students.each do |student|
        student_age_x = true if student.age == age
      end
      student_age_x
    end
    classrooms_with_student_age_x.count
  end

  def self.query_with_joins(age)
    joins(:students).where("students.age = #{age}").uniq.count
  end
end
