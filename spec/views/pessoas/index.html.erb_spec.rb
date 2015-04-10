require 'rails_helper'

RSpec.describe "pessoas/index", type: :view do
  before(:each) do
    assign(:pessoas, [
      Pessoa.create!(
        :nome => "Nome",
        :cpf => "Cpf",
        :nome_da_mae => "Nome Da Mae",
        :rg => "Rg",
        :cor => "Cor",
        :identidade_de_genero => "Identidade De Genero"
      ),
      Pessoa.create!(
        :nome => "Nome",
        :cpf => "Cpf",
        :nome_da_mae => "Nome Da Mae",
        :rg => "Rg",
        :cor => "Cor",
        :identidade_de_genero => "Identidade De Genero"
      )
    ])
  end

  it "renders a list of pessoas" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
    assert_select "tr>td", :text => "Nome Da Mae".to_s, :count => 2
    assert_select "tr>td", :text => "Rg".to_s, :count => 2
    assert_select "tr>td", :text => "Cor".to_s, :count => 2
    assert_select "tr>td", :text => "Identidade De Genero".to_s, :count => 2
  end
end
