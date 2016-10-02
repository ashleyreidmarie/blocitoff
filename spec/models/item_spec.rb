require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) {create(:item)}
  
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_length_of(:name).is_at_least(5) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:user) }

  describe "attributes" do
    it "should have the name attribute" do
      expect(item).to have_attributes(name: item.name)
    end
  end
  
end
