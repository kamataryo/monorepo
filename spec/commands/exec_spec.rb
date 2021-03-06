require 'spec_helper'
require 'tmpdir'
require 'fileutils'

require 'monorepo'

describe 'Command `exec`' do
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

  it 'executes command for each gems' do
    config = {
      'monorepo' => '0.0.0',
      'gems' => 'gems/*',
      'bundler' => 'no',
    }
    File.open('./monorepofile', 'w') { |f| f.write(config.to_yaml) }
    Dir.mkdir './gems'
    Dir.mkdir './gems/gem0'
    Dir.mkdir './gems/gem1'
    Dir.mkdir './gems/gem2'

    MonorepoCLI.start(['exec', 'touch foo.bar'])
    expect(File.exist?('./gems/gem0/foo.bar')).to be true
    expect(File.exist?('./gems/gem1/foo.bar')).to be true
    expect(File.exist?('./gems/gem2/foo.bar')).to be true
  end

  it 'specifies config file with option' do
    config = {
      'monorepo' => '0.0.0',
      'gems' => 'my_gems/*',
      'bundler' => 'no',
    }
    File.open('./my_monorepo_config', 'w') { |f| f.write(config.to_yaml) }
    Dir.mkdir './my_gems'
    Dir.mkdir './my_gems/gem0'

    MonorepoCLI.start(['exec', 'touch foo.bar', '-c', 'my_monorepo_config'])
    expect(File.exist?('./my_gems/gem0/foo.bar')).to be true
  end

  it 'works with bundler option' do
    config = {
      'monorepo' => '0.0.0',
      'gems' => 'my_gems/*',
      'bundler' => 'yes',
    }
    File.open('./my_monorepo_config', 'w') { |f| f.write(config.to_yaml) }
    Dir.mkdir './my_gems'
    Dir.mkdir './my_gems/gem0'

    stdout = `monorepo exec ls -c my_monorepo_config`
    status = $CHILD_STATUS
    expect(status.exitstatus).to be_zero
    expect(stdout).to include 'gem0'
  end

  it 'exits with a non-zero exit status if command fails for any gem' do
    config = {
      'monorepo' => '0.0.0',
      'gems' => 'gems/*',
      'bundler' => 'no',
    }

    File.open('./monorepofile', 'w') { |f| f.write(config.to_yaml) }
    %w[./gems ./gems/gem0 ./gems/gem1].each do |dir|
      Dir.mkdir dir
    end

    system 'monorepo exec 1/0'
    status = $CHILD_STATUS
    expect(status.exitstatus).to_not be_zero
  end
end
