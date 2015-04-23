require 'rails_helper'

RSpec.describe "calouros/edit", type: :view do
  before(:each) do
    @calouro = assign(:calouro, Calouro.create!())
  end

  it "renders the edit calouro form" do
    render

    assert_select "form[action=?][method=?]", calouro_path(@calouro), "post" do
    end
  end
end
