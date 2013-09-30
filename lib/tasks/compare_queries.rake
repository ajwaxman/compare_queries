require 'benchmark'

namespace :run do 
  desc "Run query comparison for Homepolish coding challenge"
  task :compare_queries => :environment do 

    Text.intro_header

    Text.intro_text

    Text.print_queries

    Benchmark.bm(27) do |bm|

      bm.report('#1: Select with each iterator') do
        Classroom.query_with_select(30).count
      end

      bm.report('#2: Joins with unique') do
        Classroom.query_with_joins(30).count
      end

      bm.report('#3: Includes with unique') do
        Classroom.query_with_includes(30).count
      end
    end

  end
end

namespace :run do 
  desc "Intro text"
  task :intro_text => :environment do 

    Text.intro_header

    Text.intro_text

    Text.print_queries

  end
end