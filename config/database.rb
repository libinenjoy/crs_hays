require 'sequel'
require "sequel/plugins/timestamps"
require 'sequel/plugins/validation_helpers'
require 'logger'

#DB connect
DB = Sequel.connect(ENV['DATABASE_URL'])
Sequel::Model.db = DB

#Log all database related logs
DB.loggers << Logger.new($stdout)

#Adding timestamp Plugin
Sequel::Model.plugin :timestamps


Sequel::Model.plugin :validation_helpers
