require 'sinatra'
require "sinatra/reloader"
require 'trafficyago'
class TrafficyagoApp < Sinatra::Base
  set :environment, ENV.fetch('RACK_ENV') { 'development' }.to_sym
  set :root, 'lib/app'
  enable :sessions
  use Rack::Flash
  get '/ayo' do
    send_file "lib/app.rb"
  end
end
