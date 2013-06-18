require 'highrise-rails4'
require 'erb'
require 'logger'
require 'tempfile'
require 'pathname'
require 'yaml'

Encoding.default_internal = "utf-8"
Encoding.default_external = "utf-8"

#Adds a way to retrieve Submodules of a Module, used for CustomContentParsers
class Module
  def submodules
    constants.collect {|const_name| const_get(const_name)}.select {|const| const.class == Module}
  end
end

module HighriseMapper
  ROOT = Pathname.new(File.dirname(__FILE__) + "/..")

  def self.config(root_dir = nil)
    root_dir ||= Pathname.new(Dir.pwd)
    path = root_dir.join("config/highrise_mapper.yml")

    raise "Invalid HighriseMapper directory; couldn't found config/highrise_mapper.yml file." unless File.file?(path)
    content = File.read(path)
    erb = ERB.new(content).result
    YAML.load(erb).with_indifferent_access
  end

end
