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
    if !(longitude.nil? || latitude.nil?)
      self[:location] = [longitude.to_f,latitude.to_f]
    elsif !address.nil?
      self[:location] = Geocoder.coordinates(address)
    else
      self[:location]
    end
  end

  def location=(source_location)
    self[:location] = source_location || location
  end

  def longitude=(source_longitude)
    self[:longitude] = source_longitude || longitude
  end

  def longitude
    if self[:longitude].nil? && !self[:location].nil?
      self[:location][0]
    else
      self[:longitude]
    end
  end

  def latitude=(source_latitude)
    self[:latitude] = source_latitude || latitude
  end

  def latitude
    if self[:latitude].nil? && !self[:location].nil?
      self[:location][1]
    else
      self[:latitude]
    end
  end

  def address
    if self[:address].nil? && !location.nil?
      Geocoder.address(location.join(","))
    else
      self[:address]
    end
  end

  def address=(source_address)
    self[:address] = source_address || address
  end
end
