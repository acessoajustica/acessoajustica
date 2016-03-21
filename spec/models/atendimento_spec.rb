require 'rails_helper'

RSpec.describe Atendimento, type: :model do
 
  describe "get all of user" do
    it "gets all of cases of the user" do
      atendimento = FactoryGirl.build(:atendimento)
      membro = FactoryGirl.build(:membro)

      Atendimento.stubs(:where).returns([atendimento])
      Membro.stubs(:find).returns(membro)

      expect(Atendimento.all_for(FactoryGirl.build(:user))).to eq([atendimento])
    end
  end

  describe "get description of its type" do
    it "gets description if it exists" do
      atendimento = FactoryGirl.build(:atendimento)
      atendimento_type = FactoryGirl.build(:atendimento_type)
      atendimento.stubs(:atendimento_type).returns(atendimento_type)

      expect(atendimento.type_description).to eq("Criminal")
    end

    it "does not get description if it does not exist" do
      atendimento = FactoryGirl.build(:atendimento)
      expect(atendimento.type_description).to eq(nil)
    end

  it "knows what atendimento_type goes with what especialidade" do
    atendimento = FactoryGirl.build(:atendimento)
    atendimento_type = FactoryGirl.build(:atendimento_type)
    estagiario = FactoryGirl.build(:estagiario)
    especialidade = FactoryGirl.build(:especialidade)
    estagiario.especialidades << especialidade
    atendimento_type.especialidades << especialidade
    atendimento.atendimento_type = atendimento_type
    expect(atendimento.canTakeMe?(estagiario)).to eq(true)
  end
  
  it "knows what atendimento_type does not goes with what especialidade" do
    atendimento = FactoryGirl.build(:atendimento)
    atendimento_type = FactoryGirl.build(:atendimento_type)
    estagiario = FactoryGirl.build(:estagiario)
    especialidade = FactoryGirl.build(:especialidade)
    especialidade2 = FactoryGirl.build(:especialidade, :another)
    estagiario.especialidades << especialidade
    atendimento_type.especialidades << especialidade2
    atendimento.atendimento_type = atendimento_type
    expect(atendimento.canTakeMe?(estagiario)).to eq(false)
  end


  
  end
end
