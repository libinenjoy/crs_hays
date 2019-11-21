ENV['SINATRA_ENV'] ||= "development"
ENV['RACK_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
require 'dotenv/load'

require_relative 'database'
require_all 'app'
