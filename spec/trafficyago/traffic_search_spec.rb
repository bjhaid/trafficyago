require 'spec_helper'
module Trafficyago
  describe TrafficSearch do 
    it "should show me traffic report around my geocode" do
      reports = subject.around([-87.686772,41.764641])
      expected = [-87.686772,41.764641]
      expect(reports.map(&:location).include?(expected)).to be_true
    end

    it "should show me traffic between two geocodes" do
      reports = subject.between([-87.663291, 41.7445],[-87.651099, 41.750534])
      expected = [-87.651099, 41.750534]
      expect(reports.map(&:location).include?(expected)).to be_true
    end

    it "should be able to get traffic in a 10km distance of a particular geocode" do
      reports = subject.in_distance_of  [-87.663291, 41.7445], 10 
      expected = [-87.651099, 41.750534]
      expect(reports.map(&:location).include?(expected)).to be_true
    end
  end

end
