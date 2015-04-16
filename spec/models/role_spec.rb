require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Role, type: :model do

  let(:user_attributes) {
    FactoryGirl.attributes_for(:user)
  }
  let(:admin_attributes) {
    FactoryGirl.attributes_for(:user, :admin_user)
  }

  describe "User" do
    describe "abilities" do
      subject(:ability){ Ability.new(user) }
      let(:user){ nil }

      context "when is not admin" do
          let(:user){ User.create! user_attributes }

          it{ should_not be_able_to(:create, User.new) }
      end
      context "when is admin" do
          let(:user){ User.create! admin_attributes }

          it{ should be_able_to(:create, User.new) }
      end
    end
  end
end
