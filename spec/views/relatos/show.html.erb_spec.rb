require 'rails_helper'

RSpec.describe "relatos/show", type: :view do
  before(:each) do
    @relato = assign(:relato, Relato.create!(
      :description => "Description",
      :caso => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
  end
end
