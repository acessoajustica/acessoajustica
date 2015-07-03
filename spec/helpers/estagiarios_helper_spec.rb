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
end

describe EstagiariosHelper do
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
end
