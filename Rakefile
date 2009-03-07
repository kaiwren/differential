require 'term/ansicolor'
  
CONFIGURATION = 'Release'
TARGET_NAME = "differential"

module Colorize
  class << self
    include Term::ANSIColor
  
    def puts(color, string)
      Kernel.puts send(color) + string + reset
    end
  end
end
 
require File.expand_path("./Tools/xcodebuild-outputparser/lib/xcode_output_parser")
 
def with_timer(&block)
  progress = Thread.new do
    loop { print '.'; STDOUT.flush; sleep 0.2 }
  end
  start = Time.now
  yield
  puts && progress.kill
  Time.now - start
end
 
namespace :spec do  
  task :clean do
    print "* Cleaning build"
    with_timer { `xcodebuild clean` }
    puts "* Done"
  end
 
  task :build do
    print "* Running specs"
    output = nil
    time_taken = with_timer do
      output = `xcodebuild -target specs -configuration #{CONFIGURATION}`
    end
    result = XcodeOutputParser::TestResultParser.new.parse_output(output)
    unless result.success?
      puts "The following specs failed:"
      result.test_suites.each do |test_suite|
        next unless test_suite.failing_tests.any?
        Colorize.puts :red, "  * #{test_suite.name}"
        test_suite.failing_tests.each do |test|
          puts "\t- #{test.name}"
          puts "\t- #{test.failure_message}"
        end
      end
    end
    Colorize.puts(result.success? ? :green : :red, 
      "* Finished in #{time_taken} seconds. #{result.total_tests_run} tests, #{result.number_of_failures} failures")
  end
 
  task :all => [:clean, :build]
end
 
task :release do
  puts "* Bumping build version."
    `agvtool bump -all`
    
  puts "* Building #{CONFIGURATION} release."
    `xcodebuild -target #{TARGET_NAME} -configuration #{CONFIGURATION} build`      
  puts "* Done."
end
 
task :default => 'spec:all'