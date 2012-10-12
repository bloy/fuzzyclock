# -*- encoding: utf-8 -*-
require File.expand_path('../lib/fuzzyclock/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mike Bloy"]
  gem.email         = ["mike@bloy.org"]
  gem.description   = %q{Fuzzy Clock utility}
  gem.summary       = %q{A fuzzy clock}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "fuzzyclock"
  gem.require_paths = ["lib"]
  gem.version       = Fuzzyclock::VERSION
end
