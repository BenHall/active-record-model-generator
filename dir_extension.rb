class Dir
  def self.require_all(directory)
    self.entries(directory).each do |file|
      if file =~ /\.rb/
        require File.join(directory, file)
      end
    end
  end
end