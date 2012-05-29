require 'spec_helper'

describe Read do
  describe "#create" do
    it "should validate presence of user" do
      Read.new(:user => users(:guybrush)).should be_valid
    end

    it "should invalidate if user isnt present" do
      Read.new.should_not be_valid
    end

    it "should be able to create new objects" do
      lambda {
        Read.create(:user => users(:guybrush))
      }.should change(Read, :count).by(1)
    end
  end
end
