require 'benchmark'

namespace :run do 
  desc "Run query comparison for Homepolish coding challenge"
  task :compare_queries => :environment do 

    Benchmark.bm(27) do |bm|

      bm.report('Query #1') do
        Classroom.query_with_select(30).count
      end

      bm.report('Query #2') do
        Classroom.query_with_joins(30).count
      end

      bm.report('Query #3') do
        Classroom.query_with_includes(30).count
      end
    end

    puts "\n"

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