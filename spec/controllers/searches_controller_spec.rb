require 'spec_helper'
describe SearchesController do

  context '#index' do
    it "is successful" do
      get :index
      expect(response).to be_success
    end
  end

  context '#show' do
    it "is successful" do
      get :show
      expect(response).to be_success
    end
  end

  context '#login' do
    it 'is successful' do
      get :login
      expect(response).to be_success
    end
  end

  context '#signup' do
    it 'is successful' do
      get :signup
      expect(response).to be_success
    end
  end

end