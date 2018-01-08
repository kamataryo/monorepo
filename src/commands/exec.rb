class MonorepoCLI
  desc 'exec [command]', 'exec commands at all the monorepo repo'
  method_option :config_filename, aliases: '-c'
  method_option :bundler, aliases: '-b'

  def exec(command_str)
    config_filename = options[:config_filename] || ''
    conf = MonorepoCLI.load_config(config_filename)

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
    bundler = options[:bundler] || conf['bundler']

    local_command_str = bundler ? "bundle exec #{command_str}" : command_str

    subdirs.each do |gem|
      Dir.chdir gem
      puts "executing `#{local_command_str}` at #{gem}..."
      system local_command_str
      Dir.chdir current
    end
  end
end
