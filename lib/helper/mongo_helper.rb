require 'mongoid'
require 'csv'

Mongoid.load!("./config/mongoid.yml", ENV['RACK_ENV'].to_sym)

module Mongoid
  def self.seed
    Traffic.create_indexes
    CSV.foreach("./db/traffic.csv", headers: true) { |row|
      traffic = Traffic.new(row.to_hash.each_with_object({}) {|(k,v),hash| hash[k.to_sym] = v })
      puts traffic.location
      traffic.save
    }
  end

  def self.reset
    Mongoid.default_session.collections.each do |coll|
      coll.drop unless coll.name == 'system.indexes'
    end
  end
end


