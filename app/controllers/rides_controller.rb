class RidesController < ApplicationController

  before_action :set_user, only: [:start]
  before_action :cab_availability, only: [:start]

  def start
    Ride.transaction do
      @ride = @user.rides.new
      @ride.cab = @user.nearest_cab(@vacant_cabs)
      @ride.save!
      @ride.cab.update!(available: false)
    end
    render json: {ride: @ride, message: 'Cab allotted'}
  end

  def stop
    @ride = Ride.find_by_id params[:id]
    render json: {message: 'Invalid ride'} unless @ride.present?

    render json: {message: 'This ride is not in progress'} unless @ride.started?

    render json: {message: 'Destination unknown'} unless stop_params[:lon].present? && stop_params[:lat].present?

    Ride.transaction do

      @ride.cab.update!({available: true})
      @ride.cab.location.update!({longitude: stop_params[:lon], latitude: stop_params[:lat]})

      #TODO: calculate and populate fare
      @ride.location = Location.create!({longitude: stop_params[:lon], latitude: stop_params[:lat], locatable: @ride})
      @ride.status = :completed
      @ride.save!
    end
    render json: {ride: @ride, message: 'Ride Completed'}
  end

  private
  def start_params
    params.permit(:user_id)
  end

  def stop_params
    params.permit(:lon, :lat)
  end

  def set_user
    @user = User.find_by_id start_params[:user_id]
    render json: {message: 'Invalid user'} unless @user.present?
  end

  def cab_availability
    @vacant_cabs = Cab.available_cabs
    @vacant_cabs = @vacant_cabs.pink_cabs if @user.hipster
    if @vacant_cabs.none?
      render json: {message: 'No Rides Available'}
    end
  end
end