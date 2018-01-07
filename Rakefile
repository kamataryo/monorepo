task :lint do
  system 'bundle exec rubocop'
end

task l: :lint

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new('spec')

task s: [:spec]
task test: [:spec]
task t: [:test]
