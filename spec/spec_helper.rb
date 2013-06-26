require 'pry'
require 'pry-nav'
require "highrise_mapper"
require 'rspec'
require 'rspec/mocks'
require "pathname"

SPECDIR = Pathname.new(File.dirname(__FILE__))
TMPDIR = SPECDIR.join("tmp")

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|r| require r}

RSpec.configure do |config|
  config.include(SpecHelper)

  config.before { FileUtils.mkdir_p(TMPDIR) }
end

def highrise_env_available?
  if ENV['HIGHRISE_TOKEN']!=nil && ENV['HIGHRISE_BASE_URL']!=nil && ENV['HIGHRISE_TOKEN']!='' && ENV['HIGHRISE_BASE_URL']!=''
    return true
  else
    puts 'INFO: No Highrise TOKEN/BASEURL environment variable defined, tests regarding HTTP communication will be ignored.'
    return false
  end
end