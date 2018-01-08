class JwelboxCLI
  desc 'rake [command]', 'exec rake task at all the jwelbox repo'
  method_option :config_filename, aliases: '-c'
  method_option :bundler, aliases: '-b'

  def rake(command_str = '')
    rake_command_str = command_str == '' ? 'rake' : "rake #{command_str}"
    exec(rake_command_str)
  end
end
