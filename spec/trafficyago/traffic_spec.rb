require 'spec_helper'
module Trafficyago
  describe Traffic do
    it "should be generate the correct location given longitude and latitude values" do
      subject = Traffic.create(longitude: -87.6269017, latitude: 41.88682729)
      expect(subject.location).to eq([-87.6269017,41.88682729])
      subject.delete
    end

    it "should be able to determine address from geocode" do
      subject = Traffic.create(longitude: -87.6269017, latitude: 41.88682729)
      expect(subject.address).to eq("United States, Illinois, Cook, Chicago, E Wacker Dr")
      subject.delete
    end

    it "should be able to determine geocode from address" do
      subject = Traffic.create(address: "United States, Illinois, Cook, Chicago, E Wacker Dr")
      expect(subject.location.map(&:to_i)).to eq([-87.621287,41.887923].map(&:to_i))
      subject.delete
    end

    it "shoud be able to determine longitude given location" do
      subject = Traffic.create(longitude: -87.6269017, latitude: 41.88682729)
      expect(subject.longitude).to eq(-87.6269017)
      subject.delete
    end

    it "should be able to determine latitude given location" do
      subject = Traffic.create(longitude: -87.6269017, latitude: 41.88682729)
      expect(subject.latitude).to eq(41.88682729)
    end
  end
end
