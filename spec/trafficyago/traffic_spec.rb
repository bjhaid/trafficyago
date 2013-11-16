require 'spec_helper'
module Trafficyago
  describe Traffic do
    it "should be generate the correct location given longitude and latitude values" do
      subject.longitude = 41.88682729
      subject.latitude = -87.6269017
      expect(subject.location).to eq([41.88682729,-87.6269017])
    end
  end
end
