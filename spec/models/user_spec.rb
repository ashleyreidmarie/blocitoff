require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {create(:user)}
  
  it { is_expected.to have_many(:items) }
  
  #Shoulda tests for name
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(2) }
  it { is_expected.to validate_length_of(:name).is_at_most(35) }
  
  describe "attributes" do
    it "should have name and email attributes" do
      expect(user).to have_attributes(name: user.name, email: user.email)
    end
    
    it "should capaitalize the name upon save" do
      user.name = "tEst"
      user.save
      expect(user.name).to eq("Test")
    end
  end
end
