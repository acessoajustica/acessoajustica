require 'rails_helper'

RSpec.describe Caso, type: :model do
 
  describe "get all of user" do
    it "gets all of cases of the user" do
      caso = FactoryGirl.build(:caso)
      membro = FactoryGirl.build(:membro)

      Caso.stubs(:where).returns([caso])
      Membro.stubs(:find).returns(membro)

      expect(Caso.all_of_user(FactoryGirl.build(:user))).to eq([caso])
    end
  end

  describe "get description of its type" do
    it "gets description if it exists" do
      caso = FactoryGirl.build(:caso)
      caso_type = FactoryGirl.build(:caso_type)
      caso.stubs(:caso_type).returns(caso_type)

      expect(caso.type_description).to eq("Criminal")
    end

    it "does not get description if it does not exist" do
      caso = FactoryGirl.build(:caso)
      expect(caso.type_description).to eq(nil)
    end
  
  end
end
