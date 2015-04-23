require 'rails_helper'

RSpec.describe "calouros/new", type: :view do
  before(:each) do
    assign(:calouro, Calouro.new())
  end

  it "renders new calouro form" do
    render

    assert_select "form[action=?][method=?]", calouros_path, "post" do
    end
  end
end
