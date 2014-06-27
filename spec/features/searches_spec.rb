require 'spec_helper'

feature 'Searches' do

  scenario 'shows the search bar on the home page' do
    visit root_path
    expect(page).to have_content 'Starting point'
    expect(page).to have_content 'Destination'
    expect(page).to have_button 'Ride!'
  end

  scenario 'renders the map for a ride' do
    visit root_path
    fill_in 'Starting point', with: '48 Wall Street'
    fill_in 'Destination', with: '30 Rockefeller Plaza'
    click_button 'Ride!'
    expect(current_path).to eq search_path
    expect(page).to have_content "Save your ride?"
  end

end
