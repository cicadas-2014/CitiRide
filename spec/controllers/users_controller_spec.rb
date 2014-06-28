require 'spec_helper'

describe UsersController do

  describe '#signup' do
    context 'when valids params are passed' do
      it 'create a new user' do
        expect {
          post :signup, user: attributes_for(:user)
        }.to change { User.count }.by(1)
      end
    end

    context 'when invalid params are passed' do
      it 'does not add user when the user is existing already' do
        create(:user, username: 'lol')
        expect {
          post :signup, user: attributes_for(:user, username: 'lol')
        }.to_not change { User.count }.by(1)
      end

      it 'does not add user when there is no input' do
        pending 'User count does not change'
      end
    end
  end
end
