class User < ApplicationRecord
  has_one :location, as: :locatable
  has_many :rides

  def nearest_cab(vacant_cabs)
    min = -1
    allotted_cab = nil
    vacant_cabs.each do |cab|
      dist = cab.location.distance(self.location)
      if min < dist
        allotted_cab = cab
      end
    end
    allotted_cab
  end
end
