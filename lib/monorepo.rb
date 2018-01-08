require 'thor'
require_relative './version'

class MonorepoCLI < Thor
  VERSION = MONOREPO_VERSION
  CONFIG_FILE_NAME = [
    'Monorepofile',
    'Monorepofile.yml',
    'Monorepofile.yaml',
    'monorepofile',
    'monorepofile.yml',
    'monorepofile.yaml',
  ].freeze

  def self.load_config(filename = '')
    config_filenames =
      if filename == ''
        CONFIG_FILE_NAME
      else
        [filename, *CONFIG_FILE_NAME]
      end

    config_filenames.each do |config_filename|
      if File.exist?(config_filename)
        config = YAML.load_file(config_filename)
        return config
      end
    end
    nil
  end
end

require_relative './commands/init'
require_relative './commands/bootstrap'
require_relative './commands/exec'
require_relative './commands/rake'
require_relative './commands/ls'
