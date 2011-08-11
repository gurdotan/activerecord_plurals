# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'rake/gempackagetask' 

PKG_FILES = FileList[
  '[a-zA-Z]*',
  'generators/**/*',
  'lib/**/*',
  'rails/**/*',
  'tasks/**/*',
  'test/**/*'
]
 
Gem::Specification.new do |s|
  s.name        = "activerecord_plurals"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = "Gur Dotan"
  s.email       = "gurdotan@gmail.com"
  s.homepage    = "http://github.com/gurdotan/activerecord_plurals"
  s.summary     = "Plural attribute methods for ActiveRecord"
  s.description = "Want all the IDs, or names, or whatever field of your ActiveRecord model?  Account.ids, Account.names ..."
 
  s.required_rubygems_version = ">= 1.3.6"
  s.add_development_dependency "rspec"
 
  s.files 	= PKG_FILES.to_a
  s.require_path = 'lib'
  s.has_rdoc 	= false
  s.extra_rdoc_files = ["README.md"]
end

