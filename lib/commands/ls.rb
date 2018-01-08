class MonorepoCLI
  desc 'ls', 'list all repo'
  method_option :config_filename, aliases: '-c'

  def ls
    config_filename = options[:config_filename] || ''
    config = MonorepoCLI.load_config(config_filename)

    unless config
      puts 'no configuration'
      exit! 1
    end
    gems = config['gems']
    subdirs =
      Dir
      .glob(gems)
      .select { |o| File.directory? o }
      .map { |dir| File.basename dir }

    if subdirs.empty?
      puts 'no gems'
      exit! 2
    end

    puts subdirs.join("\n")
  end
end
