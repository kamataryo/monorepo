require 'spec_helper'
require 'tmpdir'
require 'fileutils'

require 'monorepo'

describe 'Command `ls`' do
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

  it 'executes ls tasks for each gems' do
    config = {
      'monorepo' => '0.0.0',
      'gems' => 'gems/*',
      'bundler' => 'no',
    }
    File.open('./monorepofile', 'w') { |f| f.write(config.to_yaml) }
    Dir.mkdir './gems'
    Dir.mkdir './gems/gem0'

    MonorepoCLI.start(['ls'])
    # TODO: I want to capture STDOUT
    MonorepoCLI.start(['list'])
    # TODO: I want to capture STDOUT
  end
end
