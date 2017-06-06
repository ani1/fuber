class CabsController < ApplicationController

  before_action :set_user, only: [:index]

  def index
    cabs = Cab.available_cabs
    cabs = cabs.pink_cabs if @user.hipster
    @cab_coordinates = cabs.map{|cab| [cab.location.latitude, cab.location.longitude]}
  end

  private
  def set_user
    @user = User.find_by_id params[:user_id]
    render json: {message: 'Invalid user'} unless @user.present?
  end

end
