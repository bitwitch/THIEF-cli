require 'bundler/setup'
Bundler.require
require 'csv'

require_relative '../app/models/gadget.rb'
require_relative '../app/models/solution.rb'
require_relative '../app/models/museum.rb'
require_relative '../app/models/obstacle.rb'
require_relative '../app/models/thief.rb'
require_relative '../app/models/artwork.rb'
require_relative '../app/command_line_interface.rb'

DB = ActiveRecord::Base.establish_connection(
	adapter: 'sqlite3',
	database: 'db/museum.db'
)
