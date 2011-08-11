require 'fileutils'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../../../../config/environment", __FILE__)

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec
end


SCHEMA_FILE = File.dirname(__FILE__) + "/activerecord_plurals.sqlite3.db"

def setup_schema
  # Load the testing schema
  ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => SCHEMA_FILE)
  load(File.dirname(__FILE__) + "/schema.rb")
  require File.dirname(__FILE__) + '/../rails/init'
end

def teardown_schema
  FileUtils.rm_f(SCHEMA_FILE)
end

