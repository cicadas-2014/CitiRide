require 'spec_helper'

feature 'User entering a ride' do
  let!(:ride) { create :ride }
  let!(:rides) { [ride, create(:ride)] }

  scenario 'when logged in users can view past rides' do
    visit search_path
    rides.each do |t|
      expect(page).to have_content ride.starting_point
    end
  end

  scenario 'when logged in users can select a past ride' do
    visit search_path
    click_on "Ride"
    # wait_for_ajax_to_finish
    expect(page).to have_content "New Ride"
  end

  scenario 'when logged in users can map a route' do
    visit search_path
  #   rides.each do |t|
  #   expect(page).to have_content
  # end
  end
end
