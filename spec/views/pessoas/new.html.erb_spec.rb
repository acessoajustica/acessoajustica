require 'rails_helper'

RSpec.describe "pessoas/new", type: :view do
  before(:each) do
    assign(:pessoa, Pessoa.new(
      :nome => "MyString",
      :cpf => "MyString",
      :nome_da_mae => "MyString",
      :rg => "MyString",
      :cor => "MyString",
      :identidade_de_genero => "MyString"
    ))
  end

  it "renders new pessoa form" do
    render

    assert_select "form[action=?][method=?]", pessoas_path, "post" do

      assert_select "input#pessoa_nome[name=?]", "pessoa[nome]"

      assert_select "input#pessoa_cpf[name=?]", "pessoa[cpf]"

      assert_select "input#pessoa_nome_da_mae[name=?]", "pessoa[nome_da_mae]"

      assert_select "input#pessoa_rg[name=?]", "pessoa[rg]"

      assert_select "input#pessoa_cor[name=?]", "pessoa[cor]"

      assert_select "input#pessoa_identidade_de_genero[name=?]", "pessoa[identidade_de_genero]"
    end
  end
end
