require 'sinatra'
require 'rabl'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'builder'
require 'trafficyago'
require 'helper/mongo_helper'
class TrafficyagoApp < Sinatra::Base

  set :environment, ENV.fetch('RACK_ENV') { 'development' }.to_sym
  set :root, 'lib/app'
  enable :sessions
  use Rack::Flash

  Rabl.register!

  helpers do
    def traffic_search
      TrafficSearch.new
    end

    def traffic_helper &block
      request.body.rewind
      data = request.body.read
      if data.empty?
        @status = "failed"
        @message = "Empty Request" 
        halt 400, (rabl :error, :format => 'json')
      end
      params = JSON.parse(data)
      content_type :json
      @traffics = (yield params)
      rabl :traffic_search, :format => 'json'
    end
    protected :traffic_helper
  end

  get '/' do
    flash[:notice] = "Thanks for visiting"
  end

  post '/search_traffic_around', :provides => :json do
    traffic_helper { |params| traffic_search.around(params["location"]) }
  end

  post '/search_traffic_between_coordinates', :provides => :json do
    traffic_helper { |params| traffic_search.between_coordinates(params["location"]) }
  end

  error JSON::ParserError do
    @status = "failed"
    @message = "Bad Request, location or address not included"
    status 400
    rabl :error, :format => 'json'
  end
end
