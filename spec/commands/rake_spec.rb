require 'spec_helper'
require 'tmpdir'
require 'fileutils'

require './src/main'

describe 'Command `rake`' do
  current = Dir.pwd
  tmp = ''

  before :each do
    tmp = Dir.mktmpdir
    Dir.chdir tmp
  end

  after :each do
    Dir.chdir current
    FileUtils.rm_r tmp
  end

  it 'executes rake tasks for each gems' do
    config = {
      'jwelbox' => '0.0.0',
      'gems' => 'gems/*',
    }
    File.open('./jwelboxfile', 'w') { |f| f.write(config.to_yaml) }
    Dir.mkdir './gems'
    Dir.mkdir './gems/gem0'

    JwelboxCLI.start(['rake', '-h'])
    # TODO: I want to capture STDOUT
  end

  it 'executes rake tasks for each gems with bundler option' do
    config = {
      'jwelbox' => '0.0.0',
      'gems' => 'gems/*',
    }
    File.open('./jwelboxfile', 'w') { |f| f.write(config.to_yaml) }
    Dir.mkdir './gems'
    Dir.mkdir './gems/gem0'

    JwelboxCLI.start(['rake', '-h', '-b', 'true'])
    # TODO: I want to capture STDOUT
  end
end
