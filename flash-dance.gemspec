# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flash-dance/version'

Gem::Specification.new do |gem|
  gem.name          = "flash-dance"
  gem.version       = Flash::Dance::VERSION
  gem.authors       = ["MunkiPhD"]
  gem.email         = []
  gem.description   = %q{Flash messages that make you dance.}
  gem.summary       = %q{Works with rails flash messages to create sensible alert boxes from the get-go. See GitHub page for more info}
  gem.homepage      = "http://github.com/MunkiPhD/flash-dance"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

	# development dependencies
	gem.add_development_dependency "rspec", "~>2.6"
end
