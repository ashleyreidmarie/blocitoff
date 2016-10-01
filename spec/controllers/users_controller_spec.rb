require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) {create(:user)}

  describe "GET #show" do
    it "returns http success" do
      get :show, id: user.id
      expect(response).to have_http_status(:success)
    end
    
    it "assigns current user to @user" do
      get :show, id: user.id
      expect(assigns(:user)).to eq(user)
    end
  end

end
