require 'rails_helper'

RSpec.describe "calouros/index", type: :view do
  before(:each) do
    assign(:calouros, [
      Calouro.create!(),
      Calouro.create!()
    ])
  end

  it "renders a list of calouros" do
    render
  end
end
