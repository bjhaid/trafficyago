$LOAD_PATH.unshift File.expand_path("./../lib",__FILE__)
require 'trafficyago'
namespace :db do
  task :seed do
    Mongoid.seed
  end

  task :reset do
    Mongoid.reset
  end
end
