
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require './lib/version'

Gem::Specification.new do |spec|
  spec.name          = 'monorepo'
  spec.version       = MONOREPO_VERSION
  spec.authors       = ['kamataryo']
  spec.email         = ['mugil.cephalus+github.com@gmail.com']

  spec.summary       = 'Monorepo management tool'
  spec.description   = 'GEM based monorepo management tool'
  spec.homepage      = 'https://github.com/kamataryo/monorepo'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.2.0'

  spec.add_runtime_dependency 'thor'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
end
