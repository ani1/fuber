require 'rails_helper'

RSpec.describe Cab, type: :model do
  context 'model associations' do
      it "should have many rides" do
        t = Cab.reflect_on_association(:rides)
        t.macro.should == :has_many
      end

      it "should have one location" do
        t = Cab.reflect_on_association(:location)
        t.macro.should == :has_one
      end
  end
end