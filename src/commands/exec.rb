class JwelboxCLI
  desc 'exec', 'exec commands at all the jwelbox repo'
  def exec(command_str)
    puts "executing `#{command_str}`..."
    system command_str
  end
end
