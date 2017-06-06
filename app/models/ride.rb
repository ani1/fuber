class Ride < ApplicationRecord

  attr_accessor :distance

  belongs_to :cab
  belongs_to :user

  has_one :location, as: :locatable

  def started?
    status == 'started'
  end
end
