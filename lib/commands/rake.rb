class MonorepoCLI
  desc 'rake [command]', 'exec rake task at all the monorepo repo'
  method_option :config_filename, aliases: '-c'
  method_option :bundler, aliases: '-b'

  def rake(*args)
    exec(['rake', *args])
  end
end
