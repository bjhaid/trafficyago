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
    expect(JSON.parse output).to be_an_instance_of(Hash)
  end

  it "returns available traffic information around me" do
    post '/search_traffic_around', {location: [-87.688219, 41.941149]}.to_json
    output = last_response.body
    options = {format: :json, name: 'traffic_around_location'}
    Approvals.verify(output,options)
  end

  it "complains if no valid key is found" do
    post '/search_traffic_around'
    expect(last_response.status).to eq(400)
  end

  it "returns a json response descriptive of the error" do
    post '/search_traffic_around', "location:"
    output = last_response.body
    options = {format: :json, name: 'error'}
    Approvals.verify(output,options)
  end

  it "complains if an empty request was sent" do
    post '/search_traffic_around'
    output = last_response.body
    options = {format: :json, name: 'empty_request'}
    Approvals.verify(output,options)
  end
end
