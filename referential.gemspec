require_relative 'lib/referential/version'

Gem::Specification.new do |spec|
  spec.name          = 'referential'
  spec.version       = Referential::VERSION
  spec.authors       = ['Danielius Visockas', 'Lukas Kairevičius']
  spec.email         = ['danieliusvisockas@gmail.com', 'lumzdas@gmail.com']

  spec.summary       = 'TODO: Write a short summary, because RubyGems requires one.'
  spec.description   = 'TODO: Write a longer description or delete this line.'
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = "TODO: Put your gem's public repo URL here."
  spec.metadata['changelog_uri'] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.require_paths = ['lib']
  spec.add_development_dependency 'rspec', '~> 3.10'
end
