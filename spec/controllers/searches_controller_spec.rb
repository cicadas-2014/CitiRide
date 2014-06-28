require 'spec_helper'

describe SearchesController do
  context "#show" do
    # let!(:ride_valid) { Ride.create(starting_point: '48 wall st new york', destination: '7 carmine st new york, ny')}
    # it "has valid status" do
    #   expect(GoogleDirections.new(ride_valid.starting_point, ride_valid.destination).status).to eq "OK"
    # end

    # let!(:ride_invalid) { Ride.create(starting_point: '48 wall st new york', destination: 'xyz')}
    # it "has invalid status" do
    #   expect(GoogleDirections.new(ride_invalid.starting_point, ride_invalid.destination).status).to eq "ZERO_RESULTS"
    # end

    it 'with valid address parameters' do
      post :show, { s: '48 wall st new york', d: '7 carmine st new york, ny'}
      expect(response).to render_template(:show)
    end

    it 'with invalid address parameters' do
      post :show, { s: 'xyz', d: '7 carmine st new york, ny'}
      expect(response).to redirect_to :index
    end

  end
end
