require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) {create(:item)}
  
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_length_of(:name).is_at_least(2) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:user) }

  describe "attributes" do
    it "should have the name attribute" do
      expect(item).to have_attributes(name: item.name)
    end
  end
  
  context "scopes" do
    let(:completed_item) {create(:item, completed: true)}
    let(:uncompleted_item) {create(:item, completed: false)}
    
    describe "completed" do
      it "retrieves a list of all completed items" do
        expect(Item.completed).to eq([completed_item])
      end
    end
    
    describe "uncompleted" do
      it "retrieves a list of all uncompleted items" do
        expect(Item.uncompleted).to eq([uncompleted_item])
      end
    end
  end
  
end
