# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'credit_card_type_field/version'

Gem::Specification.new do |gem|
  gem.name          = "credit_card_type_field"
  gem.version       = CreditCardField::VERSION
  gem.authors       = ["benzhang"]
  gem.email         = ["bzbnhang@gmail.com"]
  gem.description   = %q{Credit Card type}
  gem.summary       = %q{Credit Card type field}
  gem.homepage      = "https://github.com/BenZhang/credit_card_type_field"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
  gem.add_development_dependency "bundler"
  gem.add_development_dependency "rspec-rails", "~> 2.6"
  gem.add_development_dependency "mocha"
  gem.add_development_dependency "capybara", "~> 1.1"
  gem.add_development_dependency "coffee-rails", '~> 3.2.1'
  gem.add_development_dependency 'sass-rails',   '~> 3.2.3'
end
