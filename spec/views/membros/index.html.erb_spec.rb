require 'rails_helper'

RSpec.describe "membros/index", type: :view do
  before(:each) do
    assign(:membros, [
      Membro.create!(),
      Membro.create!()
    ])
  end

  it "renders a list of membros" do
    render
  end
end
