# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'B64/version'

Gem::Specification.new do |spec|
  spec.name          = "B64"
  spec.version       = B64::VERSION
  spec.authors       = ["Derek Viera"]
  spec.email         = ["ma.dmviera01@gmail.com"]

  spec.summary       = "Note taking to Base64 encoding"
  spec.description   = "Take notes to Base64 encoding to read later"
  spec.homepage      = "https://github.com/rangeroob/B64"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0.0"
end
