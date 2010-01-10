require 'rubygems'
require 'active_record'

def connect(options)
  ActiveRecord::Base.establish_connection options
end

def tables
  ActiveRecord::Base.connection.tables
end

def make_model_directory()
  Dir.mkdir(@models_directory) unless File.exists?(@models_directory) && File.directory?(@models_directory)
end

def model_exists?(name)
  File.exists? File.join(@models_directory,name)
end

def write_model_file(name)
  File.open("#{File.join(@models_directory,name)}.rb", 'w') do |f| 
    f.puts("class #{name} < ActiveRecord::Base")
    f.puts("end")
  end
end

def create_model(name)
  return if reject name
  make_model_directory
  write_model_file name unless model_exists?(name)
end

def reject(name)
  name == 'sysdiagram'
end