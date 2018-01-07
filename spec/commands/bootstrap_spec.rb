require 'spec_helper'
require 'tmpdir'
require 'fileutils'
require 'Thor'

class JwelboxCLI < Thor; end

require './src/commands/bootstrap'

describe 'Bootstrap' do
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

  it 'creates configure file' do
    JwelboxCLI.start(['bootstrap'])
    expect(Dir.exist?('./Jwelboxfile')).to be true
  end
end
