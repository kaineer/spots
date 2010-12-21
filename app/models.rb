# Spot models
#

require 'dm-core'
require 'dm-migrations'

$:.unshift( File.dirname( __FILE__ ) )

module Models
  def self.all_files
    %w( spot )
  end

  def self.startup
    migrate
  end

  def self.require_from( dir, files = all_files )
    files.each do |name|
      filename = File.join( dir, name + ".rb" )
      print "[DEBUG] Loading from #{filename}.."
      begin
        require filename
      rescue LoadError => le
        puts "FAIL"
      else
        puts "OK"
      end
    end
  end

  def self.migrate
    datamapper_startup
    require_from "models"

    DataMapper.finalize
    DataMapper.auto_upgrade!
  end

  def self.datamapper_startup
    DataMapper.setup( :default, 
                      config_datamapper_startup ||
                      local_datamapper_startup )
  end

  def self.config_datamapper_startup
    nil
  end

  def self.local_datamapper_startup
    Dir.mkdir( "db" ) unless File.directory?( "db" )
    "sqlite3:///#{Dir.pwd}/db/spots.db"
  end
end
