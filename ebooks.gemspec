# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ebooks/version'

Gem::Specification.new do |spec|
  spec.name          = "ebooks"
  spec.version       = Ebooks::VERSION
  spec.authors       = ["Parker Moore"]
  spec.email         = ["parkrmoore@gmail.com"]
  spec.description   = %q{Generate your own horse_ebooks for fun and for profit}
  spec.summary       = %q{horse_ebooks with and without twitter}
  spec.homepage      = "https://github.com/parkr/ebooks"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "thread", "~> 0.1"
  spec.add_runtime_dependency "twitter", "~> 5.0"
  spec.add_runtime_dependency "marky_markov", "~> 0.3"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_development_dependency "guard-rspec", "~> 4.5"
  spec.add_development_dependency "guard-cucumber", "~> 1.5"
  spec.add_development_dependency "aruba", "~> 0.6"
end
