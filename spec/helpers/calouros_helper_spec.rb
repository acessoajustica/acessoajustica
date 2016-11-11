require 'rails_helper'

describe CalourosHelper do
    it "sorts 'calouros'" do
      user = FactoryGirl.build(:user)

      calouro1 = FactoryGirl.build(:calouro)
      calouro1.membro.user = user

      calouro2 = FactoryGirl.build(:calouro, :new_calouro)
      calouro2.membro.user = user

      calouros_ordenados = helper.calouros_ordenados([calouro1, calouro2])

      expect(calouros_ordenados).to eq([calouro2, calouro1])
    end
end
