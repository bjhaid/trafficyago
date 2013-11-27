class TrafficSearch
  def around location, distance = 5 
    Traffic.near_sphere(location: location).max_distance(location: km_to_geospherical_distance(distance))
  end

  def between_coordinates pointA, pointB
    resultA = Traffic.where(:location.within_box => [pointA,pointB])
    resultB = Traffic.where(:location.within_box => [pointB,pointA])
    resultA << resultB
    resultA
  end

  def between_addresses addressA, addressB
    trafficA, trafficB = Traffic.new, Traffic.new
    trafficA.address = addressA
    trafficB.address = addressB
    between_coordinates(trafficA.location, trafficB.location)
  end


  def in_distance_of location, distance_in_km
    around location, distance_in_km
  end

  private
  def km_to_geospherical_distance distance_in_km
    distance_in_km/6371.0
  end
end
