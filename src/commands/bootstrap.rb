require 'yaml'

class JwelboxCLI
  desc 'bootstrap', 'bootstrap jwelbox repo'

  def bootstrap
    default_config = {
      'jwelbox' => '0.0.0',
      'gems' => 'gems/*',
    }

    File.open('./Jwelboxfile', 'w') { |f| f.write(default_config.to_yaml) }
    Dir.mkdir './gems'
  end
end
