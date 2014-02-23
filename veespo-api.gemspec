# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "veespo-api"
  spec.version       = Veespo::Version
  spec.authors       = ["francescoagati"]
  spec.email         = ["f.agati@veespo.com"]
  spec.description   = %q{Wrapper for Veespo API}
  spec.summary       = "veespo api wrapper"
  spec.homepage      = "https://veespo.com"
  spec.license       = "MIT"
end