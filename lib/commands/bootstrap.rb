class MonorepoCLI
  desc 'bootstrap', 'bootstrap each repo'
  method_option :config_filename, aliases: '-c'

  def bootstrap(*args)
    exec ['bundle', *args].join(' ')
  end
end
