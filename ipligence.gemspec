# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ipligence/version"

Gem::Specification.new do |spec|
  spec.name          = "ipligence"
  spec.version       = Ipligence::VERSION
  spec.authors       = ["Sebastian Komianos, Fernando Guillen"]
  spec.email         = ["sebastian.komianos@daliaresearch.com"]
  spec.summary       = "A ruby gem for the IPligence database"
  spec.description   = "A gem to integrate the IPligence database in ruby"
  spec.homepage      = "http://github.com/DaliaResearch/ipligence"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "active_record"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "mysql"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "minitest"
end
