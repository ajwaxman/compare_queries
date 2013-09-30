class Classroom < ActiveRecord::Base
  has_many :students
  attr_accessible :name

  def self.query_with_select(age)
    classrooms_with_student_age_x = self.all.select do |classroom|
      student_age_x = false
      classroom.students.each do |student|
        if student.age == age
          student_age_x = true 
          break
        end
      end
      student_age_x
    end
    classrooms_with_student_age_x
  end

  def self.query_with_joins(age)
    joins(:students).where("students.age = #{age}").uniq
  end

  def self.query_with_includes(age)
    includes(:students).where("students.age = #{age}")
  end
end
