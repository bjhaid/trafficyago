require 'trafficyago/traffic_search'
require 'trafficyago/traffic'
require 'mongoid' 

ENV['RACK_ENV'] ||= 'development'
Mongoid.load!("config/mongoid.yml", ENV['RACK_ENV'].to_sym) 
