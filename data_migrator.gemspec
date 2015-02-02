# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "data_migrator/version"

Gem::Specification.new do |s|
  s.name        = "data_migrator"
  s.version     = DataMigrator::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Matthieu Parey"]
  s.email       = ["matthieu@ifeelgoods.com"]
  s.homepage    = "https://github.com/ifeelgoods/data-migrator"
  s.summary     = %q{Rake tasks to migrate data.}
  s.description = %q{Rake tasks to migrate data.}

  s.add_dependency('rails', '~> 4.1.0')

  s.add_development_dependency "rspec-rails", "~> 3.1.0"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "generator_spec"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
