module HighriseMapper
  class ConfigGenerator < Rails::Generators::Base
    source_root File.expand_path('../../../../templates/config', __FILE__)

    def create_config_file
      config_yml = 'highrise_mapper.yml'
      copy_file config_yml, "config/#{config_yml}"
    end
  end
end
