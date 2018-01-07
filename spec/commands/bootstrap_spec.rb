require 'spec_helper'
require 'tmpdir'
require 'fileutils'
require 'thor'
require 'yaml'

class JwelboxCLI < Thor
  # accept partial definition and isolate testing subcommands
end

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
    expect(File.exist?('./Jwelboxfile')).to be true
  end

  describe 'configured contents' do
    it 'has jwelbox version information' do
      JwelboxCLI.start(['bootstrap'])
      conf = YAML.load_file('./Jwelboxfile')
      expect(conf['jwelbox']).to eq '0.0.0'
    end

    it 'has jwelbox default package location path' do
      JwelboxCLI.start(['bootstrap'])
      conf = YAML.load_file('./Jwelboxfile')
      expect(conf['gems']).to eq 'gems/*'
    end
  end

  it 'creates new package folder' do
    JwelboxCLI.start(['bootstrap'])
    expect(Dir.exist?('./gems')).to be true
  end
end
