# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "data_migrator/version"

Gem::Specification.new do |s|
  s.name        = "data_migrator"
  s.version     = DataMigrator::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Andrew J Vargo"]
  s.email       = ["ajvargo@computer.org"]
  s.homepage    = "http://ajvargo.com"
  s.summary     = %q{Rake tasks to migrate.}
  s.description = %q{Rake tasks to migrate.}

  s.add_dependency('rails', '~> 4.1.0')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
