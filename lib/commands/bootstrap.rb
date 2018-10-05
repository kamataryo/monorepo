class MonorepoCLI
  desc 'bootstrap', 'Bootstrap each child repository'
  method_option :config_filename, aliases: '-c'

  def bootstrap(*args)
    exec ['bundle', *args].join(' ')
  end
end
