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

# increments

def increment_version(section)
  regex = /(?<major>[0-9]+)\.(?<minor>[0-9]+)\.(?<patch>[0-9]+)/
  version_file = './lib/version.rb'
  source = ''

  File.open(version_file, 'r+') do |f|
    source = f.read
  end

  matches = source.match(regex)
  versions = {
    major: matches[:major],
    minor: matches[:minor],
    patch: matches[:patch],
  }

  old_version_text = [
    versions[:major],
    versions[:minor],
    versions[:patch],
  ].join '.'

  versions[section] = (versions[section].to_i + 1).to_s
  if section == :major
    versions[:minor] = '0'
    versions[:patch] = '0'
  elsif section == :minor
    versions[:patch] = '0'
  end

  new_version_text = [
    versions[:major],
    versions[:minor],
    versions[:patch],
  ].join '.'

  File.open(version_file, 'w') do |f|
    f.write source.gsub(regex, new_version_text)
  end

  puts "increment #{old_version_text} to #{new_version_text}."
end

task :patch do
  increment_version :patch
end

task :minor do
  increment_version :minor
end

task :major do
  increment_version :major
end
