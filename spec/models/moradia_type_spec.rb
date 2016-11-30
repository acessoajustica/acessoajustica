require 'rails_helper'

RSpec.describe MoradiaType, type: :model do
  let(:valid_attributes) do
    FactoryGirl.attributes_for(:moradia_type)
  end

  before :all do
    @moradia_type = MoradiaType.create! valid_attributes
  end

  it "created_at is not nil" do
    @moradia_type.created_at = nil
    expect(@moradia_type).to_not be_valid
  end
 
  it "updated_at is not nil" do
    @moradia_type.updated_at = nil
    expect(@moradia_type).to_not be_valid
  end

  it "description is nil" do
    @moradia_type.description = nil
    expect(@moradia_type).to be_valid
  end
end
