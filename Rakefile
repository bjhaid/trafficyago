$LOAD_PATH.unshift File.expand_path("./../lib",__FILE__)
require 'trafficyago'
namespace :db do
  task :seed do
    Mongoid.seed
  end

  task :create_indexes do
    Traffic.create_indexes
  end

  task :remove_indexes do
    Traffic.remove_indexes
  end

  task :reset do
    Mongoid.reset
  end
end
