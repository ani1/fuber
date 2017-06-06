require 'rails_helper'

RSpec.describe RidesController, type: :controller do

  describe 'routing' do
    it 'routes GET rides/start to RidesController#start' do
      expect(get: '/rides/start').to route_to(controller: 'rides', action: 'start')
    end

    it 'routes GET rides/:id/stop to RidesController#stop' do
      expect(get: "/rides/#{1}/stop").to route_to(controller: 'rides', action: 'stop', id: '1')
    end
  end

  #users
  let(:normal_user){User.create(hipster: false)}
  let(:loc_user1){Location.create(latitude: -4, longitude: -4, locatable: normal_user)}

  let(:hipster_user){User.create(hipster: true)}
  let(:loc_user2){Location.create(latitude: 2, longitude: 2, locatable: hipster_user)}

  #cabs
  let(:cab1){Cab.create(color: "white", available: true)}
  let(:loc_cab1){Location.create(latitude: 2, longitude: 2, locatable: cab1)}

  let(:cab2){Cab.create(color: "pink", available: true)}
  let(:loc_cab2){Location.create(latitude: -3, longitude: 3, locatable: cab2)}

  let(:cab3){Cab.create(color: "white", available: true)}
  let(:loc_cab3){Location.create(latitude: -2, longitude: -2, locatable: cab3)}

  let(:cab4){Cab.create(color: "pink", available: true)}
  let(:loc_cab4){Location.create(latitude: -3, longitude: -3, locatable: cab4)}

  let(:cab5){Cab.create(color: "white", available: false)}
  let(:loc_cab5){Location.create(latitude: -3, longitude: -3, locatable: cab5)}

  let(:cab6){Cab.create(color: "white", available: false)}
  let(:loc_cab6){Location.create(latitude: -4, longitude: -4, locatable: cab6)}

  #Rides
  let(:ride1){Ride.create(cab: cab4, user: normal_user)}
  let(:ride2){Ride.create(cab: cab2, user: hipster_user)}


  describe 'start' do
    it "should assign nearest cab to normal user" do
      cab1
      loc_cab1
      cab2
      loc_cab2
      cab3
      loc_cab3
      cab4
      loc_cab4
      normal_user
      loc_user1

      get :start, {user_id: normal_user.id}
      expect(assigns(:ride).cab).to eq(cab4)
      expect(assigns(:ride).cab.available).to eq(false)
    end

    it "should assign nearest pink cab to hipster user" do
      cab1
      loc_cab1
      cab2
      loc_cab2
      cab3
      loc_cab3
      hipster_user
      loc_user2

      get :start, {user_id: hipster_user.id}
      expect(assigns(:ride).cab).to eq(cab2)
      expect(assigns(:ride).cab.available).to eq(false)
    end

    it "should notify if no rides available" do
      cab5
      loc_cab5
      cab6
      loc_cab6
      normal_user
      loc_user1

      get :start, {user_id: normal_user.id}
      response.body.should == "{\"message\":\"No Rides Available\"}"
    end
  end

  describe 'stop' do
    it "should complete ride and mark cab available" do
      cab4
      loc_cab4
      normal_user
      loc_user1
      ride1

      params = {
          id: ride1.id,
          lon: 0,
          lat: 0
      }

      get :stop, params

      expect(assigns(:ride).status).to eq("completed")
      expect(assigns(:ride).cab.available).to eq(true)

      expect(assigns(:ride).cab.location.longitude).to eq(0)
      expect(assigns(:ride).cab.location.latitude).to eq(0)

      expect(assigns(:ride).location.longitude).to eq(0)
      expect(assigns(:ride).location.latitude).to eq(0)
    end
  end

end
