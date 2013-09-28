# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create 50 different classrooms based on (potential) future Flatiron School classrooms

classrooms = []

100.times do |num|
  classroom = Classroom.create(:name => Forgery::Address.city)
  classrooms << classroom
end


# Create 2000 students with random names and ages and associate them with a random class

2000.times do |num|
  student = classrooms[Random.rand(0...classrooms.length)].students.build(:name => Forgery::Name.full_name, :age => Random.rand(20..50))
  student.save
end 