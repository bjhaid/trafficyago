module Trafficyago
  Traffic = Struct.new(:geocode, :address, :situation)
  class TrafficSearch
    def around location
      traffic = Traffic.new
      traffic.geocode = [2.0456,2.0001]
      [traffic]
    end
  end
end
