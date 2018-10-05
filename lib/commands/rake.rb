class MonorepoCLI
  desc 'rake [command]', 'Execute `rake` for each child repository'
  method_option :config_filename, aliases: '-c'
  method_option :bundler, aliases: '-b'

  def rake(*args)
    exec(['rake', *args])
  end
end
