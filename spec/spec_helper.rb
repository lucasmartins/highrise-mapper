require "highrise_mapper"
require "pathname"
require "test_notifier/runner/rspec"

SPECDIR = Pathname.new(File.dirname(__FILE__))
TMPDIR = SPECDIR.join("tmp")

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|r| require r}

RSpec.configure do |config|
  config.include(SpecHelper)

  config.before { FileUtils.mkdir_p(TMPDIR) }
end
