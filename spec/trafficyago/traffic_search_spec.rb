require 'spec_helper'
module Trafficyago
  describe TrafficSearch do 
    it "should show me traffic report around me" do
      reports = subject.around([-87.686772,41.764641])
      expected = [-87.686772,41.764641]
      expect(reports.map(&:location).include?(expected)).to be_true
    end
  end
end
