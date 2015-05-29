require 'rails_helper'

RSpec.describe Caso, type: :model do
  describe "get all of user" do
    it "get all of cases of the user" do
      caso = FactoryGirl.build(:caso)
      membro = FactoryGirl.build(:membro)

      Caso.stubs(:where).returns([caso])
      Membro.stubs(:find).returns(membro)

      expect(Caso.all_of_user(FactoryGirl.build(:user))).to eq([caso])
    end
  end
end
