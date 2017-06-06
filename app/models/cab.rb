class Cab < ApplicationRecord
  has_one :location, as: :locatable
  has_many :rides

  scope :available_cabs, -> {where(available: true)}
  scope :pink_cabs, -> {where(color: 'pink')}
end
