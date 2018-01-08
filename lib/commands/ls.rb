class MonorepoCLI
  desc 'ls', 'exec rake task at all the monorepo repo'

  def ls
    exec('ls')
  end
end
