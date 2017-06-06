require 'rails_helper'

RSpec.describe Location, type: :model do
  it "should belong to locatable" do
    t = Location.reflect_on_association(:locatable)
    t.macro.should == :belongs_to
  end
end
