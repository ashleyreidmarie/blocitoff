require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) {create(:user)}
  let(:other_user) {create(:user)}
  let(:item) {create(:item, user: user) }

  context "guest user" do
    
    describe "Get new" do
      it "redirects the user to the sign in view" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    
    describe "POST create" do
      it "redirects the user to the sign in view" do
        post :create, item: {name: Faker::Educator.course}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
  
  context "signed in user CRUD" do
    before { sign_in(user) }
    
    describe "GET new" do
      it "is successful" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end
    
    describe "POST create" do
      it "creates a new items on the user's list" do
        expect{ post :create, format: :js, item: {name: Faker::Educator.course} }.to change(user.items,:count).by(1)
      end
      
      it "redirects to user#show view" do
        post :create, format: :js, item: {name: Faker::Educator.course}
        expect(response).to have_http_status(:success)
      end
    end
  end
  
end
