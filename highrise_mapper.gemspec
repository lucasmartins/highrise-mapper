# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "highrise_mapper/version"

Gem::Specification.new do |s|
  s.name                  = "highrise_mapper"
  s.version               = HighriseMapper::Version::STRING
  s.platform              = Gem::Platform::RUBY
  s.required_ruby_version = ">= 1.9.3"
  s.authors               = ["Lucas Martins"]
  s.email                 = ["lucasmartins@railsnapraia.com"]
  s.homepage              = "http://rubygems.org/gems/highrise-mapper"
  s.summary               = "Experimental Gem"
  s.description           = s.summary
  s.license               = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "highrise-rails4"

  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-nav"
end
