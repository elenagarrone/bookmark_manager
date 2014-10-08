require 'data_mapper'
require './app/data_mapper_setup'

task :auto_upgrade do
	DataMapper.auto_upgrade!
	puts "Auto-upgrade complete (no data loss)"
end

task :auto_migrade do
	DataMapper.auto_migrade!
	puts "Auto-migrate complete (data could have been lost"
end