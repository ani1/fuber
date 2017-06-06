require 'rails_helper'

RSpec.describe User, type: :model do
  it "should have one location" do
    t = User.reflect_on_association(:location)
    t.macro.should == :has_one
  end

  it "should have many rides" do
    t = User.reflect_on_association(:rides)
    t.macro.should == :has_many
  end
end
