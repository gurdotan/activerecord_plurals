require 'rake'
require 'rspec/core/rake_task'


desc 'Default: run specs.'
task :default => :spec


desc 'Test the activerecord_plurals plugin.'
RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = ["-fn", "-c"]
  t.pattern = 'spec/**/*_spec.rb'
  t.verbose = true
end

