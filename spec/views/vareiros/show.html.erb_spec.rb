require 'rails_helper'

RSpec.describe "vareiros/show", type: :view do
  before(:each) do
    @vareiro = assign(:vareiro, Vareiro.create!(
      :forum => "Forum"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Forum/)
  end
end
