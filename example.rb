require 'model_generator'
require 'dir_extension'
require 'array_extension'
require 'yaml'

@models_directory = 'model'

db_config = YAML::load(File.open('database.yml'))
connect(db_config)
          
tables.singularize {|t| create_model t}
Dir.require_all @models_directory