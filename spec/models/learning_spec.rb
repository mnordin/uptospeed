require 'spec_helper'

describe Learning do
  describe "#create" do
    it "should validate presence of user" do
      Learning.new(:user => users(:guybrush)).should be_valid
    end

    it "should invalidate if user isnt present" do
      Learning.new.should_not be_valid
    end

    it "should be able to create new objects" do
      lambda {
        Learning.create(:user => users(:guybrush))
      }.should change(Learning, :count).by(1)
    end
  end
end
