require 'rails_helper'

RSpec.describe "calouros/show", type: :view do
  before(:each) do
    @calouro = assign(:calouro, Calouro.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
