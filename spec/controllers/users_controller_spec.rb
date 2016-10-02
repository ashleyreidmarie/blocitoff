require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) {create(:user)}

  describe "for guest user" do
    it "returns http redirect" do
      get :show, id: user.id
      expect(response).to redirect_to(new_user_session_path)
    end
  end
  
  describe "for logged in user" do
    before { sign_in(user) }
    
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

end
