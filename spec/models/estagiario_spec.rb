require 'rails_helper'

RSpec.describe Estagiario, type: :model do

  let(:valid_attributes) do
    FactoryGirl.attributes_for(:estagiario)
  end

  before :each do
    @estagiario = Estagiario.create! valid_attributes
  end

  it "created_at is not nil" do
    @estagiario.created_at = nil
    expect(@estagiario).to_not be_valid
  end
 
  it "updated_at is not nil" do
    @estagiario.updated_at = nil
    expect(@estagiario).to_not be_valid
  end
end
