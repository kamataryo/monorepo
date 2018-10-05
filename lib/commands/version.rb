class MonorepoCLI
  desc 'version', 'Display monorepo version information'
  def version
    STDOUT.write "#{VERSION}\n"
  end
end
