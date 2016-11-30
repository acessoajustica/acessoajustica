require 'rails_helper'

RSpec.describe Vareiro, type: :model do
  let(:valid_attributes) do
    FactoryGirl.attributes_for(:vareiro)
  end

  before :each do
    @vareiro = Vareiro.create! valid_attributes
  end

  it "created_at is not nil" do
    @vareiro.created_at = nil
    expect(@vareiro).to_not be_valid
  end
 
  it "updated_at is not nil" do
    @vareiro.updated_at = nil
    expect(@vareiro).to_not be_valid
  end 

  it "forum is nil" do
    @vareiro.forum = nil
    expect(@vareiro).to_not be_valid
  end
end
