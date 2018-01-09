class MonorepoCLI
  desc 'version', 'monorepo version info'
  def version
    STDOUT.write "#{VERSION}\n"
  end
end
