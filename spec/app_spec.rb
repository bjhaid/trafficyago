require 'sinatra/base'
require 'rack/test'
require 'rack-flash'
require 'spec_helper'
require 'app'


include Rack::Test::Methods
def app
  TrafficyagoApp
end

describe "TrafficyagoApp" do
  it "returns a json response" do
    post '/search_traffic_around', {location: [-87.688219, 41.941149]}.to_json
    output = last_response.body
    expect(JSON.parse output).to be_an_instance_of(Array)
  end

  it "returns available traffic information around me" do
    post '/search_traffic_around', {location: [-87.688219, 41.941149]}.to_json
    output = last_response.body
    options = {format: :json, name: 'traffic_around_location'}
    Approvals.verify(output,options)
  end
end
