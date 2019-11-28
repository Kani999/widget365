lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'widgets365/version'

Gem::Specification.new do |spec|
  spec.name          = 'widgets365'
  spec.version       = Widgets365::VERSION
  spec.authors       = ['Jan Krupa']
  spec.email         = ['jankrupa93@gmail.com']

  spec.summary       = '365-Widget sensors classification'
  spec.description   = 'Evaluates 365-Widget Sensors \
                        to identify their quality assurance'
  # spec.homepage      = ''

  # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  # spec.metadata['homepage_uri'] = spec.homepage
  # spec.metadata['source_code_uri'] = "TODO: Put your gem's public repo URL"
  # spec.metadata['changelog_uri'] = "TODO: Put your gem's CHANGELOG.md URL"

  # Specify which files should be added to the gem when it is released.
  # The `git command` loads files in the RubyGem that have been added into git.
  # spec.files = Dir.chdir(File.expand_path(__dir__)) do
  #   `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
