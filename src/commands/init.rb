class JwelboxCLI
  desc 'init', 'init jwelbox repo'
  method_option :gems, aliases: '-g'
  method_option :config_filename, aliases: '-c'
  method_option :bundler, aliases: '-b'
  def init
    gem_location = options[:gems] || 'gems'
    config_filename = options[:config_filename] || './Jwelboxfile'
    bundler =
      if %w[TRUE YES Y].include?((options[:bundler] || '').upcase)
        'yes'
      else
        'no'
      end

    default_config = {
      'jwelbox' => VERSION,
      'gems' => "#{gem_location}/*",
      'bundler' => bundler,
    }

    File.open(config_filename, 'w') { |f| f.write(default_config.to_yaml) }
    Dir.mkdir "./#{gem_location}"
  end
end
