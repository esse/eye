# -*- encoding: utf-8 -*-
require File.expand_path('../lib/eye', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["'Konstantin Makarchev'"]
  gem.email         = ["'kostya27@gmail.com'"]
  gem.description   = %q{Write a gem description}
  gem.summary       = %q{Write a gem summary}
  gem.homepage      = "http://github.com/kostya/eye"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "eye"
  gem.require_paths = ["lib"]
  gem.version       = Eye::VERSION

  gem.required_ruby_version     = '>= 1.9.2' # because of celluloid
  gem.required_rubygems_version = '>= 1.3.6'  
  
  gem.add_dependency 'celluloid'
  gem.add_dependency 'state_machine'
  gem.add_dependency 'activesupport'
  #gem.add_dependency 'posix-spawn'
  #gem.add_dependency 'cocaine'
  gem.add_dependency 'celluloid-io'
  gem.add_dependency 'thor'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'rr'
  gem.add_development_dependency 'ruby-graphviz'
  gem.add_development_dependency 'forking'
  gem.add_development_dependency 'fakeweb'
end
