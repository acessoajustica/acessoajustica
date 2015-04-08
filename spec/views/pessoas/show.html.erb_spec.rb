require 'rails_helper'

RSpec.describe "pessoas/show", type: :view do
  before(:each) do
    @pessoa = assign(:pessoa, Pessoa.create!(
      :nome => "Nome",
      :cpf => "Cpf",
      :nome_da_mae => "Nome Da Mae",
      :rg => "Rg",
      :cor => "Cor",
      :identidade_de_genero => "Identidade De Genero"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(/Nome Da Mae/)
    expect(rendered).to match(/Rg/)
    expect(rendered).to match(/Cor/)
    expect(rendered).to match(/Identidade De Genero/)
  end
end
