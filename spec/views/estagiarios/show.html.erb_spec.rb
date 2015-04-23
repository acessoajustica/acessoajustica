require 'rails_helper'

RSpec.describe "estagiarios/show", type: :view do
  before(:each) do
    @estagiario = assign(:estagiario, Estagiario.create!(
      :especialidade => "Especialidade"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Especialidade/)
  end
end
