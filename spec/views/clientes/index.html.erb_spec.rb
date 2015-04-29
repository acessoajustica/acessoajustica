require 'rails_helper'

RSpec.describe "clientes/index", type: :view do
  before(:each) do
    assign(:clientes, [
      Cliente.create!(
        :filhos_quantidade => 1,
        :profissao_nome => "Profissao Nome",
        :familia_quantidade => "Familia Quantidade",
        :familia_renda => "9.99",
        :contribuintes_quantidade => 2,
        :estado_civil => nil,
        :moradia_type => nil,
        :profissao_type => nil
      ),
      Cliente.create!(
        :filhos_quantidade => 1,
        :profissao_nome => "Profissao Nome",
        :familia_quantidade => "Familia Quantidade",
        :familia_renda => "9.99",
        :contribuintes_quantidade => 2,
        :estado_civil => nil,
        :moradia_type => nil,
        :profissao_type => nil
      )
    ])
  end

  it "renders a list of clientes" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Profissao Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Familia Quantidade".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
