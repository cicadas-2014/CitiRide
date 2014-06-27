require 'spec_helper'
  describe UsersController do
    let!(:user) { create :user }


    context "user#new" do
      it "returns a form for creating a new user " do
        expect {
          get :new, :user_id => user.id
          expect()
        }
      end

      end

      it "user#create" do
        it "creates a new user" do
        expect {
          post :create, user_id => user.user_id, :id => user.id
          expect(response).to be_success
          }.to change { User.count }.by(1)
      end
    end

  end
end
