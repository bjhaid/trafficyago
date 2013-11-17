require 'sinatra'
require 'trafficyago'
require 'helper/mongo_helper'
class TrafficyagoApp < Sinatra::Base
  set :environment, ENV.fetch('RACK_ENV') { 'development' }.to_sym
  set :root, 'lib/app'
  enable :sessions
  use Rack::Flash

  def traffic_search
    TrafficSearch.new
  end


  get '/' do
    flash[:notice] = "Thanks for visiting"
  end

  post '/search_traffic_around', :provides => :json do
    params = JSON.parse(request.env["rack.input"].read)
    content_type :json
    traffic_search.around(params["location"]).to_json
  end
end
