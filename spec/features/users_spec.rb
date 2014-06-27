require 'spec_helper'

feature 'User management' do
  # scenario 'shows the search bar on the home page' do
  #   visit root_path
  #   expect(page).to have_content 'Starting point'
  #   expect(page).to have_content 'Destination'
  #   expect(page).to have
  # end

  # scenario 'adds a new user' do
  #   pending "Create new user"
  # end


end


describe "Users" do
  let!(:user) { User.create(email: 'a@a.com', username: 'jake', password_digest: 'jake') }
  describe "User signs up" do
    it "logs in user when valid parameters are passed" do
      visit new_user_path
      fill_in 'email', with: user.email
      fill_in 'username', with: user.username
      fill_in 'password', with: user.password_digest
      click_button 'Submit'
      expect(response.status).to eq 200
    end
  end
end
