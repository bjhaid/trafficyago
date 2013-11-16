require 'mongoid'
class Traffic
  include ::Mongoid::Document
  field :location, type: Array
  index({location: '2dsphere'}, {min: -180, max: 180})
  field :longitude, type: Float
  field :latitude, type: Float
  field :address, type: String
  field :situation, type: String

  def location
    location = [longitude.to_f,latitude.to_f]
  end
end
