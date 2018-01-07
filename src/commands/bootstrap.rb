class JwelboxCLI
  desc 'bootstrap', 'bootstrap jwelbox repo'
  def bootstrap
    puts 'executing bootstrap command'
    Dir.mkdir './Jwelboxfile'
  end
end
