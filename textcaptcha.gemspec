# -*- encoding: utf-8 -*-
require File.expand_path('../lib/textcaptcha/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Drew Tempelmeyer"]
  gem.email         = ["drewtemp@gmail.com"]
  gem.description   = %q{Ruby gem to use the textcaptcha.com service}
  gem.summary       = %q{Ruby gem to use the textcaptcha.com service}
  gem.homepage      = "https://github.com/drewtempelmeyer/textcaptcha"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "textcaptcha"
  gem.require_paths = ["lib"]
  gem.version       = Textcaptcha::VERSION
  gem.date          = "2012-01-19"

  gem.add_dependency('httparty', '>= 0.8.1')

  # Development dependencies
  gem.add_development_dependency 'rake', '>= 0.9.2'
  gem.add_development_dependency 'rdoc', '>= 2.5.0'
end
