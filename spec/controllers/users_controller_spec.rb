require 'spec_helper'

describe UsersController do

  describe '#new' do
    it 'renders a new page' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a user object' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe '#create' do
    context 'when valids params are passed' do
      it 'create a new user' do
        expect {
          post :create, user: (attributes_for :user)
        }.to change { User.count }.by(1)
      end
    end

    context 'when invalid params are passed' do
      let!(:user) { attributes_for :user }
      it 'returns an error for an invalid user' do
        expect {
          post :create, user: (attributes_for :user)
          post :create, user: (attributes_for :user)
        }.to_not change { User.count }.by(1)
      end
    end
  end
end
