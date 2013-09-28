require 'benchmark'

namespace :run do 
  desc "Run query comparison for Homepolish coding challenge"
  task :compare_queries => :environment do 
    

    Benchmark.bm(27) do |bm|

      bm.report('1) Select pre') do
        Classroom.query_with_select(30)
      end

      bm.report('2) Joins with unique pre') do
        Classroom.query_with_joins(30)
      end

      Classroom.includes(:students)

      bm.report('3) Select post') do
        Classroom.query_with_select(30)
      end

      bm.report('4) Joins with unique post') do
        Classroom.query_with_joins(30)
      end

    end



  end
end