class JwelboxCLI
  desc 'exec [command]', 'exec commands at all the jwelbox repo'
  method_option :config_filename, aliases: '-c'

  def exec(command_str)
    config_filename = options[:config_filename] || ''
    conf = JwelboxCLI.load_config(config_filename)

    unless conf
      puts 'no configuration'
      exit! 1
    end

    gems = conf['gems']
    subdirs = Dir.glob(gems).select { |o| File.directory?(o) }

    if subdirs.empty?
      puts 'no gems'
      exit! 2
    end

    current = Dir.pwd

    subdirs.each do |gem|
      Dir.chdir gem
      puts "executing `#{command_str}` at #{gem}..."
      system command_str
      Dir.chdir current
    end
  end
end