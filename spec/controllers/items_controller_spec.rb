require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) {create(:user)}
  let!(:item) {create(:item, user: user) }

  context "guest user" do
    
    describe "POST create" do
      it "redirects the user to the sign in view" do
        post :create, item: {name: Faker::Educator.course}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    
    describe "DELETE destroy" do
      it "redirects the user to the sign in view" do
        delete :destroy, {id: item.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    
    describe "PUT complete" do
      it "redirects the user to the sign in view" do
        put :complete, id: item.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    
  end
  
  context "signed in user CRUD" do
    before { sign_in(user) }
    
    describe "POST create" do
      it "creates a new items on the user's list" do
        expect{ post :create, format: :js, item: {name: Faker::Educator.course} }.to change(user.items,:count).by(1)
      end
      
      it "redirects to user#show view" do
        post :create, format: :js, item: {name: Faker::Educator.course}
        expect(response).to have_http_status(:success)
      end
    end
    
    describe "POST complete" do
      it "completes the item" do
        post :complete, format: :js, id: item.id
        expect(item.completed).to be_truthy
      end
    end
    
    describe "DELETE destroy" do
      it "removes the item" do
        expect{ delete :destroy, {id: item.id}, format: :js }.to change(Item, :count).by(-1)
      end
    end
  end
  
end
