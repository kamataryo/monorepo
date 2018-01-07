task :lint do
  system 'bundle exec rubocop'
end

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new('spec')
task default: :spec
