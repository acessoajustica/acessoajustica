require 'rails_helper'

RSpec.describe "casos/show", type: :view do
  before(:each) do
    @caso = assign(:caso, Caso.create!(
      :status => false,
      :cliente => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
