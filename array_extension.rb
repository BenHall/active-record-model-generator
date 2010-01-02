require 'active_record'
class Array
  def singularize
    self.each {|val| yield(val.singularize)}
  end
end