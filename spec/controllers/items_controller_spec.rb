require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) {create(:user)}
  let(:other_user) {create(:user)}
  let(:item) {create(:item, user: user) }

  context "guest user" do
    describe "POST create" do
      it "redirects the user to the sign in view" do
        post :create, item: {name: Faker::Educator.course}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
  
  context "signed in user CRUD" do
    before { sign_in(user) }
    
    describe "POST create" do
      it "creates a new items on the user's list" do
        expect{ post :create, item: {name: Faker::Educator.course} }.to change(user.items,:count).by(1)
      end
      
      it "redirects to user#show view" do
        post :create, item: {name: Faker::Educator.course}
        expect(response).to redirect_to(user_path(user.id))
      end
    end
  end
  
end
