require 'rails_helper'

RSpec.describe Ride, type: :model do
  context 'model associations' do

    it "should have one location" do
      t = Ride.reflect_on_association(:location)
      t.macro.should == :has_one
    end

    it "should belong to cab" do
      t = Ride.reflect_on_association(:cab)
      t.macro.should == :belongs_to
    end

    it "should belong to user" do
      t = Ride.reflect_on_association(:user)
      t.macro.should == :belongs_to
    end
  end
end
