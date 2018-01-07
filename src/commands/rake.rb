class JwelboxCLI
  desc 'rake [command]', 'exec rake task at all the jwelbox repo'
  method_option :config_filename, aliases: '-c'
  method_option :bundler, aliases: '-b'

  def rake(command_str)
    exec("rake #{command_str}")
  end
end
