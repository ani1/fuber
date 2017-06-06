require 'rails_helper'

RSpec.describe CabsController, type: :controller do

  describe 'routing' do
    it 'routes GET users/:id/cabs to CabsController#index' do
      expect(get: "/users/#{1}/cabs").to route_to(controller: 'cabs', action: 'index', user_id: '1')
    end
  end

  describe "GET #index" do
    it "renders the index template" do
      get :index
      response.should render_template(:index)
    end
  end

end
