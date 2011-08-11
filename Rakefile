require 'rake'
require 'rspec/core/rake_task'
require 'rake/gempackagetask'


desc 'Default: run specs.'
task :default => :spec


desc 'Test the activerecord_plurals plugin.'
RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = ["-fn", "-c"]
  t.pattern = 'spec/**/*_spec.rb'
  t.verbose = true
end


PKG_FILES = FileList[
  '[a-zA-Z]*',
  'generators/**/*',
  'lib/**/*',
  'rails/**/*',
  'tasks/**/*',
  'test/**/*'
]
 
spec = Gem::Specification.new do |s|
  s.name = "activerecord_plurals"
  s.version = "0.0.1"
  s.author = "Gur Dotan"
  s.email = "gurdotan@gmail.com"
  s.platform = Gem::Platform::RUBY
  s.summary = "Plural attribute methods: Account.ids, Account.names ..."
  s.files = PKG_FILES.to_a
  s.require_path = "lib"
  s.has_rdoc = false
  s.extra_rdoc_files = ["README.md"]
end
 
desc 'Turn this plugin into a gem.'
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

