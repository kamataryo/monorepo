class MonorepoCLI
  desc 'exec [COMMAND]', 'exec commands at all the monorepo repo'
  method_option :config_filename, aliases: '-c'
  method_option :bundler, aliases: '-b'

  def exec(*args)
    command_str = args.join ' '
    config_filename = options[:config_filename] || ''
    config = MonorepoCLI.load_config(config_filename)

    unless config
      STDERR.print "\e[31m[error]\e[0m no configuration file found.\n"
      STDERR.print 'run `monorepo init`'
      exit! 1
    end

    gems = config['gems']
    subdirs = Dir.glob(gems).select { |o| File.directory?(o) }

    if subdirs.empty?
      STDERR.print "\e[31m[error]\e[0m gem folder `#{gems}` not found.\n"
      STDERR.print 'run `monorepo init`'
      exit! 2
    end

    current = Dir.pwd
    bundler =
      options[:bundler] ||
      %w[YES Y TRUE].include?(config['bundler'].upcase)

    local_command_str = bundler ? "bundle exec #{command_str}" : command_str

    subdirs.each do |gem|
      Dir.chdir gem
      puts "executing `#{local_command_str}` at #{gem}..."
      system local_command_str
      Dir.chdir current
    end
  end
end
