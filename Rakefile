require "bundler/gem_tasks"
require 'rspec/core/rake_task'
require 'cucumber/rake/task'

RSpec::Core::RakeTask.new
Cucumber::Rake::Task.new

task :console do
  sh "irb -r./lib/ebooks.rb"
end

task :default => [:spec, :cucumber]
