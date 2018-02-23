require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe '#show' do

    it "renders the user's profile page" do
      user = User.create(email: 'iain@example.com', password: 'password')
      get :show, params: { id: user.id }
      expect(response.status).to eq(200)
    end
  end
end
