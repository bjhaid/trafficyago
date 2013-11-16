class TrafficSearch
  def around location
    Traffic.geo_near(location).spherical
  end
end
