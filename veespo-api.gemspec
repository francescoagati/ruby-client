# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'veespo/api'

Gem::Specification.new do |spec|
  spec.name          = "veespo-api"
  spec.version       = Veespo::Version
  spec.authors       = ["francescoagati"]
  spec.email         = ["f.agati@veespo.com"]
  spec.description   = %q{Wrapper for Veespo API}
  spec.summary       = "veespo api wrapper"
  spec.homepage      = "https://veespo.com"
  spec.license       = "MIT"



  if spec.respond_to? :specification_version then
    spec.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      spec.add_runtime_dependency(%q<faraday>, ["~> 0.9"])
      spec.add_runtime_dependency(%q<faraday_middleware>, [">= 0.9"])
    else
      spec.add_dependency(%q<faraday>, ["~> 0.8"])
      spec.add_dependency(%q<faraday_middleware>, [">= 0.9"])
    end
  else
    spec.add_dependency(%q<faraday>, ["~> 0.8"])
    spec.add_dependency(%q<faraday_middleware>, [">= 0.9"])
  end

end

