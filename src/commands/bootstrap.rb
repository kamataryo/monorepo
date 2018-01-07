require 'yaml'

class JwelboxCLI
  desc 'bootstrap', 'bootstrap jwelbox repo'
  method_option :gems, aliases: '-g'
  method_option :config_filename, aliases: '-c'

  def bootstrap
    gem_location = options[:gems] || 'gems'
    config_filename = options[:config_filename] || './Jwelboxfile'

    default_config = {
      'jwelbox' => '0.0.0',
      'gems' => "#{gem_location}/*",
    }

    File.open(config_filename, 'w') { |f| f.write(default_config.to_yaml) }
    Dir.mkdir "./#{gem_location}"
  end
end
