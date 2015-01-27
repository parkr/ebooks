require "bundler/gem_tasks"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new

task :console do
  sh "irb -r./lib/ebooks.rb"
end

task :default => [:spec]
