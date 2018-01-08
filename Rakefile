require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

task :lint do
  system 'bundle exec rubocop'
end

task l: :lint

RSpec::Core::RakeTask.new(:spec)

task s: [:spec]
task test: [:spec]
task t: [:test]
