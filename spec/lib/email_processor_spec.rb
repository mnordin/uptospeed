require "spec_helper"
require_relative "../../lib/email_processor"

describe EmailProcessor do
  let(:email) { FactoryGirl.build(:email) }
  let(:user) { FactoryGirl.build(:user) }

  describe "#process" do
    before do
      user.save
    end

    it "should create a workout" do
      expect do
        EmailProcessor.process(email)
      end.to change { user.workouts.count }.by(1)
    end

    it "should create a learning" do
      email.body = "1 learnings"

      expect do
        EmailProcessor.process(email)
      end.to change { user.learnings.count }.by(1)
    end

    describe "creating multiple objects" do
      before do
        email.body = "3 learnings\n5 workouts"
      end

      subject { lambda { EmailProcessor.process(email) } }

      it { should change { user.learnings.count }.by(3) }
      it { should change { user.workouts.count }.by(5) }

    end
  end

end
