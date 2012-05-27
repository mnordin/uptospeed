require 'spec_helper'

describe "user" do

  describe "creating" do
    it "should be able to create a new user with first_name, last_name and email" do
      user = User.create(:first_name => "Bo", :last_name => "Foo", :email => "bo.foo@example.com")
      user.should be_valid
      User.last.should eq(user)
    end

    it "should not be able to save a user with same email" do
      user = users(:sven)
      new_user = User.new(:email => "sven.bertil@mynewsdesk.com")
      new_user.should_not be_valid
      new_user.create.should raise_error
    end
  end

  describe ".name" do
    it "should return full name" do
      user = users(:guybrush)
      user.name.should eq("Guybrush Threepwood")
    end
  end
end