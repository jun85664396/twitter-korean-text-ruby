# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twkorean/version'

Gem::Specification.new do |spec|
  spec.name          = "twkorean"
  spec.version       = Twkorean::VERSION
  spec.authors       = ["JunSangPil"]
  spec.email         = ["jun85664396@gmail.com"]
  spec.summary       = %q{Ruby interface to twitter-korean-text}
  spec.description   = %q{Ruby interface to twitter-korean-text}
  spec.homepage      = "https://github.com/jun85664396/twkorean-ruby"
  spec.license       = "Apache License 2.0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rjb"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'minitest'
end
