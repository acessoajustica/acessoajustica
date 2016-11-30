require 'rails_helper'

RSpec.describe MoradiaType, type: :model do
  before :each do
    valid_attributes = FactoryGirl.attributes_for(:moradia_type)
    @moradia_type = MoradiaType.create! valid_attributes

    puts @moradia_type.inspect
  end

  it "created_at is not nil" do
    @moradia_type.created_at = nil
    expect(@moradia_type).to_not be_valid
  end
 
  it "updated_at is not nil" do
    @moradia_type.updated_at = nil
    expect(@moradia_type).to_not be_valid
  end
 
end
