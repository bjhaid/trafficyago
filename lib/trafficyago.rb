require 'trafficyago/traffic_search'
require 'trafficyago/traffic'
require 'mongoid' 
require 'helper/mongo_helper'
require 'geocoder'

ENV['RACK_ENV'] ||= 'development'
Mongoid.load!("config/mongoid.yml", ENV['RACK_ENV'].to_sym) 
Geocoder.configure(:lookup => :yandex)
