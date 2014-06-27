describe UserController do

  describe '#new' do
    it 'renders a new page' do
      get :new
      expect(response).to render_template(:new)
    end
  end

end
