class Location < ApplicationRecord
  belongs_to :locatable, polymorphic: true

  def distance(loc)
    Math.sqrt((self.longitude - loc.longitude)**2 + (self.latitude - loc.latitude)**2)
  end
end
