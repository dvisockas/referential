require_relative 'lib/referential/version'
require_relative 'lib/referential'

Gem::Specification.new do |spec|
  spec.name          = 'referential'
  spec.version       = Referential::VERSION
  spec.authors       = ['Danielius Visockas', 'Lukas Kairevičius']
  spec.email         = ['danieliusvisockas@gmail.com', 'lumzdas@gmail.com']

  spec.summary       = 'Turns your methods into curryable procs'
  spec.homepage      = 'https://github.com/dvisockas/referential'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/dvisockas/referential'
  spec.metadata['changelog_uri'] = 'https://github.com/dvisockas/referential/blob/master/CHANGELOG.md'

  spec.files = [
    'lib/referential.rb',
    'lib/referential/version.rb',
  ]

  spec.require_paths = ['lib']
  spec.add_development_dependency 'rspec', '~> 3.10'
end
