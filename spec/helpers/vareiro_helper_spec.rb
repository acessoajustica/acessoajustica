require 'rails_helper'

describe VareirosHelper do
	it "sorts 'vareiros'" do
		user = FactoryGirl.build(:user)

    vareiro1 = FactoryGirl.build(:vareiro)
    vareiro1.membro.user = user

    vareiro2 = FactoryGirl.build(:vareiro, :new_vareiro)
    vareiro2.membro.user = user

    vareiros_ordenados = helper.vareiros_ordenados([vareiro1, vareiro2])

    expect(vareiros_ordenados).to eq([vareiro2, vareiro1])
	end
end
