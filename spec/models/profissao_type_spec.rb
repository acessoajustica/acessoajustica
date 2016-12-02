require 'rails_helper'

RSpec.describe ProfissaoType, type: :model do
  let(:valid_attributes) do
    FactoryGirl.attributes_for(:profissao_type)
  end

  before :each do
    @profissao_type = ProfissaoType.create! valid_attributes
  end

  it "created_at is not nil" do
    @profissao_type.created_at = nil
    expect(@profissao_type).to_not be_valid
  end
 
  it "updated_at is not nil" do
    @profissao_type.updated_at = nil
    expect(@profissao_type).to_not be_valid
  end

  it "description is nil" do
    @profissao_type.description = nil
    expect(@profissao_type).to be_valid
  end
end
