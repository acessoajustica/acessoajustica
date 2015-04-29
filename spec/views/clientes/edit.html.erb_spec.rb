require 'rails_helper'

RSpec.describe "clientes/edit", type: :view do
  before(:each) do
    @cliente = assign(:cliente, Cliente.create!(
      :filhos_quantidade => 1,
      :profissao_nome => "MyString",
      :familia_quantidade => "MyString",
      :familia_renda => "9.99",
      :contribuintes_quantidade => 1,
      :estado_civil => nil,
      :moradia_type => nil,
      :profissao_type => nil
    ))
  end

  it "renders the edit cliente form" do
    render

    assert_select "form[action=?][method=?]", cliente_path(@cliente), "post" do

      assert_select "input#cliente_filhos_quantidade[name=?]", "cliente[filhos_quantidade]"

      assert_select "input#cliente_profissao_nome[name=?]", "cliente[profissao_nome]"

      assert_select "input#cliente_familia_quantidade[name=?]", "cliente[familia_quantidade]"

      assert_select "input#cliente_familia_renda[name=?]", "cliente[familia_renda]"

      assert_select "input#cliente_contribuintes_quantidade[name=?]", "cliente[contribuintes_quantidade]"

      assert_select "input#cliente_estado_civil_id[name=?]", "cliente[estado_civil_id]"

      assert_select "input#cliente_moradia_type_id[name=?]", "cliente[moradia_type_id]"

      assert_select "input#cliente_profissao_type_id[name=?]", "cliente[profissao_type_id]"
    end
  end
end
