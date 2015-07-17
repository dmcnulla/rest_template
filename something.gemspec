# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version/version'

Gem::Specification.new do |spec|
  spec.name          = 'something'
  spec.version       = Something::VERSION
  spec.authors       = ['Dave McNulla']
  spec.email         = ['mcnulla@gmail.com']
  spec.description   = 'Server monitor'
  spec.summary       = 'Small monitor service for testing servers status'
  spec.homepage      = 'https://github.com/dmcnulla/something'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(/^bin/) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)/)
  spec.require_paths = ['lib']

  spec.add_dependency 'rest_baby', '~> 0.8'

  spec.add_development_dependency 'rubocop', '~> 0.32'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 0'
  spec.add_development_dependency 'cucumber', '~> 1.3', '>= 1.3.5'
  spec.add_development_dependency 'fig_newton', '~> 0.9'
  spec.add_development_dependency 'rspec', '~> 2.14', '>= 2.14.1'
  spec.add_development_dependency 'webmock', '~> 1.13', '>= 1.13.0'
  spec.add_development_dependency 'geminabox', '~> 0.12', '>= 0.12.4'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'yard-cucumber'
end
