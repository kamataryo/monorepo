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
    MonorepoCLI.start(['init'])
    expect(File.exist?('./Monorepofile')).to be true
  end

  it 'creates specified configure file' do
    MonorepoCLI.start(['init', '--config_filename', './Monorepofile.yaml'])
    expect(File.exist?('./Monorepofile.yaml')).to be true
  end

  it 'creates specified configure file with an abbreviated option' do
    MonorepoCLI.start(['init', '-c', './Monorepofile.yaml'])
    expect(File.exist?('./Monorepofile.yaml')).to be true
  end

  describe 'configured contents' do
    it 'has monorepo version information' do
      MonorepoCLI.start(['init'])
      conf = YAML.load_file('./Monorepofile')
      expect(conf['monorepo']).to eq MonorepoCLI::VERSION
    end

    it 'has default monorepo gem location path' do
      MonorepoCLI.start(['init'])
      conf = YAML.load_file('./Monorepofile')
      expect(conf['gems']).to eq 'gems/*'
    end

    it 'has specified monorepo gem location path' do
      MonorepoCLI.start(['init', '--gems', 'specified_gems'])
      conf = YAML.load_file('./Monorepofile')
      expect(conf['gems']).to eq 'specified_gems/*'
    end

    it 'has specified monorepo gem location path with an abbreviated option' do
      MonorepoCLI.start(['init', '-g', 'specified_gems'])
      conf = YAML.load_file('./Monorepofile')
      expect(conf['gems']).to eq 'specified_gems/*'
    end

    it 'has default bundler option' do
      MonorepoCLI.start(['init'])
      conf = YAML.load_file('./Monorepofile')
      expect(conf['bundler']).to eq 'no'
    end

    it 'has specified bundler option' do
      MonorepoCLI.start(['init', '--bundler', 'true'])
      conf = YAML.load_file('./Monorepofile')
      expect(conf['bundler']).to eq 'yes'
    end
  end

  it 'creates new gem folder' do
    MonorepoCLI.start(['init'])
    expect(Dir.exist?('./gems')).to be true
  end

  it 'creates specified gem folder' do
    MonorepoCLI.start(['init', '--gems', 'specified_gems'])
    expect(Dir.exist?('./specified_gems')).to be true
  end

  it 'creates specified gem folder with an abbreviated option' do
    MonorepoCLI.start(['init', '-g', 'specified_gems'])
    expect(Dir.exist?('./specified_gems')).to be true
  end
end
