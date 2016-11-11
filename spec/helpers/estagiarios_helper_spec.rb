require 'rails_helper'

describe EstagiariosHelper do
  it "presents well the 'especialidades'" do
    list = [
      FactoryGirl.build(:especialidade),
      FactoryGirl.build(:especialidade),
      FactoryGirl.build(:especialidade)
    ]
    filteredList = [
      [list[0].description, list[0].id],
      [list[1].description, list[1].id],
      [list[2].description, list[2].id]
    ]
    expect(helper.get_especialidades_helper(list)).to eq(filteredList)
  end

  it "can add a lot of 'especialidades'" do
    estagiario = FactoryGirl.build(:estagiario)
    especialidade = FactoryGirl.build(:especialidade)
    list = ["1","2","3"]
    Especialidade.stubs(:find).returns(especialidade)
    helper.add_all_especialidades(estagiario, list)
    expect(estagiario.especialidades).to eq([
      especialidade,
      especialidade,
      especialidade
    ])
  end

  it "sorts 'estagiarios'" do
    user = FactoryGirl.build(:user)
    estagiario1 = FactoryGirl.build(:estagiario)
    estagiario1.membro.user = user

    estagiario2 = FactoryGirl.build(:estagiario, :new_estagiario)
    estagiario2.membro.user = user

    estagiario3 = FactoryGirl.build(:estagiario, :another)
    estagiario3.membro.user = user

    estagiarios = [estagiario1, estagiario2, estagiario3]

    estagiarios_ordenados = helper.estagiarios_ordenados(estagiarios)
    expect(estagiarios_ordenados).to eq([estagiario2, estagiario1, estagiario3])
  end
end
