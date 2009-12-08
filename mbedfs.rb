require 'rubygems'
require 'fusefs'
require 'mbedonline'


class MbedFS
  def initialize(username,password)
    @mbed = MbedOnline::API.new(username,password)
  end
  
  def contents(path)
    return @mbed.list_projects if path == "/"
    return [] if not @mbed.is_project?(File.basename(path))
    return @mbed.list_files(File.basename(path))
  end
  
  def file?(path)
    @mbed.is_file?(File.dirname(path)[1..-1],File.basename(path))
  end
  
  def directory?(path)
    @mbed.is_project?(File.basename(path))
  end
  
  def read_file(path)
    @mbed.file_contents(File.dirname(path)[1..-1],File.basename(path))
  end

  def size(path)
    puts "size:"
    p File.dirname(path)[1..-1]
    p File.basename(path)
    @mbed.file_contents(File.dirname(path)[1..-1],File.basename(path)).length
  end
end

FuseFS.set_root( MbedFS.new("notauser","notapassword") )

# Mount under a directory given on the command line.
FuseFS.mount_under 'mount/'
FuseFS.run
