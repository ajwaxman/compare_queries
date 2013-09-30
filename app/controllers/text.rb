class Text < ActionController::Base

  def self.intro_header

puts <<-TEXT
 _    _                                  _ _     _     
| |  | |                                | (_)   | |    
| |__| | ___  _ __ ___   ___ _ __   ___ | |_ ___| |__  
|  __  |/ _ \\| '_ ` _ \\ / _ \\ '_ \\ / _ \\| | / __| '_ \\ 
| |  | | (_) | | | | | |  __/ |_) | (_) | | \__ \ | | |
|_|  |_|\\___/|_| |_| |_|\\___| .__/ \\___/|_|_|___/_| |_|
                            | |                        
                            |_|                       
  _____ _           _ _                       
/ ____| |         | | |                      
| |    | |__   __ _| | | ___ _ __   __ _  ___ 
| |    | '_ \\ / _` | | |/ _ \\ '_ \\ / _` |/ _ \\
| |____| | | | (_| | | |  __/ | | | (_| |  __/
 \\_____|_| |_|\\__,_|_|_|\\___|_| |_|\\__, |\\___|
                                     __/ |     
                                    |___/         

By Adam Waxman                 
TEXT
    
  end

  def self.intro_text
    intro_text = "I've created two ActiveRecord models associated with the following tables: classrooms and students.  Classrooms have many students, and students have a name and age. I've created a seed.rb file that will create 200 classrooms and 2,000 students that are randomly assigned a name, an age (between 20-50), and a classroom_id. The query I'm running is answering the folling question: how many of the classrooms have a 30 year old student in the class? Now for the three different queries..."
    intro_text_array = intro_text.split("")
    intro_text_array.each_with_index do |char, index|
      if char == "." && intro_text_array[index + 1] == " "
        print char
        sleep(1)
      else
        print char
        sleep(0.04)
      end
    end
    return ""
  end

  def self.print_queries

    puts "\nEach query is written as a class method in the Classroom model\n"
    sleep (1)

    print "\nQuery #1"
    5.times do |i|
      print "."
      sleep(1)
    end

    puts <<-TEXT  

    \n
    Query #1: Iterates through all the classrooms using 'select' and then iterates through the students in each classroom to find out which classrooms have a student with age 30

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
           
    TEXT

    print "\nQuery #2"
    5.times do |i|
      print "."
      sleep(1)
    end

    puts <<-TEXT  

    \n
    Query #2: Query classrooms using ActiveRecord joins and where finder methods
    
    def self.query_with_joins(age)
      joins(:students).where("students.age = \#{age}").uniq
    end
           
    TEXT

    print "\nQuery #3"
    5.times do |i|
      print "."
      sleep(1)
    end

    puts <<-TEXT  

    \n
    Query #3: Query classrooms using ActiveRecord includes and where finder methods
    
    def self.query_with_includes(age)
      includes(:students).where("students.age = \#{age}")
    end
           
    TEXT

    print "\nNow for the results"
    5.times do |i|
      print "."
      sleep(1)
    end
    puts ""
  end

end