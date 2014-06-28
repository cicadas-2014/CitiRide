# require 'spec_helper'

# feature 'User management', :js => true do
#   # scenario 'shows the search bar on the home page' do
#   #   visit root_path
#   #   expect(page).to have_content 'Starting point'
#   #   expect(page).to have_content 'Destination'
#   #   expect(page).to have
#   # end

#   # scenario 'adds a new user' do
#   #   pending "Create new user"
#   # end


# end

#  # WIP !!!!!!!!
# describe "Users" do
#   let!(:user) { User.create(email: 'a@a.com', username: 'jake', password: 'jake', password_confirmation: 'jake') }
#   describe "User signs up" do
#     it "logs in user when valid parameters are passed" do
#       visit new_user_path
#       fill_in 'user[email]', with: user.email
#       fill_in 'user[username]', with: user.username
#       fill_in 'user[password]', with: user.password
#       fill_in 'user[password_confirmation]', with: user.password_confirmation
#       click_button 'Create User'
#  # <<<<<<<<<<<
#       expect(response).to redirect_to(root_path)
#     end
#   end

#   describe "User login" do
#     context "from the root path" do
#       it "displays login form" do
#         visit root_url
#         click_button 'Login'
#         expect(response.status).to eq 200
#       end

#       it "directs back to root page upon login" do
#         visit root_url
#         click_button 'Login'
#         expect(response.status).to eq 200
#       end
#     end
#   end
# end
