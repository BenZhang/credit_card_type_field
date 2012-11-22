# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'credit_card_field/version'

Gem::Specification.new do |gem|
  gem.name          = "credit_card_field"
  gem.version       = CreditCardField::VERSION
  gem.authors       = ["benzhang"]
  gem.email         = ["bzbnhang@gmail.com"]
  gem.description   = %q{Credit Card type}
  gem.summary       = %q{Credit Card type field}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
