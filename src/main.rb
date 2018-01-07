require 'thor'

class JwelboxCLI < Thor
  CONFIG_FILE_NAME = [
    'Jwelboxfile',
    'Jwelboxfile.yml',
    'Jwelboxfile.yaml',
    'jwelboxfile',
    'jwelboxfile.yml',
    'jwelboxfile.yaml',
  ].freeze

  VERSION = '0.0.0'.freeze

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
require_relative './commands/exec'
require_relative './commands/rake'
