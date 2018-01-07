require 'spec_helper'
require 'tmpdir'
require 'fileutils'
require 'yaml'

require './src/main'

describe 'Command `init`' do
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
    JwelboxCLI.start(['init'])
    expect(File.exist?('./Jwelboxfile')).to be true
  end

  it 'creates specified configure file' do
    JwelboxCLI.start(['init', '--config_filename', './Jwelboxfile.yaml'])
    expect(File.exist?('./Jwelboxfile.yaml')).to be true
  end

  it 'creates specified configure file with an abbreviated option' do
    JwelboxCLI.start(['init', '-c', './Jwelboxfile.yaml'])
    expect(File.exist?('./Jwelboxfile.yaml')).to be true
  end

  describe 'configured contents' do
    it 'has jwelbox version information' do
      JwelboxCLI.start(['init'])
      conf = YAML.load_file('./Jwelboxfile')
      expect(conf['jwelbox']).to eq JwelboxCLI::VERSION
    end

    it 'has default jwelbox gem location path' do
      JwelboxCLI.start(['init'])
      conf = YAML.load_file('./Jwelboxfile')
      expect(conf['gems']).to eq 'gems/*'
    end

    it 'has specified jwelbox gem location path' do
      JwelboxCLI.start(['init', '--gems', 'specified_gems'])
      conf = YAML.load_file('./Jwelboxfile')
      expect(conf['gems']).to eq 'specified_gems/*'
    end

    it 'has specified jwelbox gem location path with an abbreviated option' do
      JwelboxCLI.start(['init', '-g', 'specified_gems'])
      conf = YAML.load_file('./Jwelboxfile')
      expect(conf['gems']).to eq 'specified_gems/*'
    end

    it 'has default bundler option' do
      JwelboxCLI.start(['init'])
      conf = YAML.load_file('./Jwelboxfile')
      expect(conf['bundler']).to eq 'no'
    end

    it 'has specified bundler option' do
      JwelboxCLI.start(['init', '--bundler', 'true'])
      conf = YAML.load_file('./Jwelboxfile')
      expect(conf['bundler']).to eq 'yes'
    end
  end

  it 'creates new gem folder' do
    JwelboxCLI.start(['init'])
    expect(Dir.exist?('./gems')).to be true
  end

  it 'creates specified gem folder' do
    JwelboxCLI.start(['init', '--gems', 'specified_gems'])
    expect(Dir.exist?('./specified_gems')).to be true
  end

  it 'creates specified gem folder with an abbreviated option' do
    JwelboxCLI.start(['init', '-g', 'specified_gems'])
    expect(Dir.exist?('./specified_gems')).to be true
  end
end
