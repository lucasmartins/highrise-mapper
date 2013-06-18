require 'highrise'
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

  load 'highrise_mapper/context.rb'
  load 'highrise_mapper/person.rb'

  def self.config(root_dir=nil)
    @config ||= load_config(root_dir)
  end

  def self.load_config(root_dir=nil)
    root_dir ||= Pathname.new(Dir.pwd)
    unless root_dir.end_with?('/')
      root_dir+='/'
    end
    path = "#{root_dir}config/highrise_mapper.yml"

    raise "Couldn't find config yml at #{path}." unless File.file?(path)
    content = File.read(path)
    erb = ERB.new(content).result
    YAML.load(erb).with_indifferent_access
  end

end
