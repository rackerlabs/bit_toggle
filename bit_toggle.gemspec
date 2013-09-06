# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bit_toggle/version'

Gem::Specification.new do |spec|
  spec.name          = "bit_toggle"
  spec.version       = BitToggle::VERSION
  spec.authors       = ["Josh Schairbaum"]
  spec.email         = ["josh.schairbaum@rackspace.com"]
  spec.description   = %q{An elementary feature toggle implementation}
  spec.summary       = %q{An elementary feature toggle implementation}
  spec.homepage      = "https://github.com/rackerlabs/bit_toggle"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "redis"
  spec.add_runtime_dependency "redis-namespace"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
