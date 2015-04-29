require 'rails_helper'

RSpec.describe "clientes/show", type: :view do
  before(:each) do
    @cliente = assign(:cliente, Cliente.create!(
      :filhos_quantidade => 1,
      :profissao_nome => "Profissao Nome",
      :familia_quantidade => "Familia Quantidade",
      :familia_renda => "9.99",
      :contribuintes_quantidade => 2,
      :estado_civil => nil,
      :moradia_type => nil,
      :profissao_type => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Profissao Nome/)
    expect(rendered).to match(/Familia Quantidade/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
