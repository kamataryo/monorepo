class MonorepoCLI
  desc 'ls', 'List all child repositories'
  method_option :config_filename, aliases: '-c'

  def ls
    config_filename = options[:config_filename] || ''
    config = MonorepoCLI.load_config(config_filename)

    unless config
      STDERR.print "\e[31m[error]\e[0m no configuration file found.\n"
      STDERR.print 'run `monorepo init`'
      exit! 1
    end
    gems = config['gems']
    subdirs =
      Dir
      .glob(gems)
      .select { |o| File.directory? o }
      .map { |dir| File.basename dir }

    if subdirs.empty?
      STDERR.print "\e[31m[error]\e[0m gem folder `#{gems}` not found.\n"
      STDERR.print 'run `monorepo init`'
      exit! 2
    end

    puts subdirs.join("\n")
  end

  desc 'list', 'List all child repositories'
  method_option :config_filename, aliases: '-c'

  def list
    self.ls
  end
end
