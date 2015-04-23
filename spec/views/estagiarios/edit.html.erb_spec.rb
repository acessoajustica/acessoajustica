require 'rails_helper'

RSpec.describe "estagiarios/edit", type: :view do
  before(:each) do
    @estagiario = assign(:estagiario, Estagiario.create!(
      :especialidade => "MyString"
    ))
  end

  it "renders the edit estagiario form" do
    render

    assert_select "form[action=?][method=?]", estagiario_path(@estagiario), "post" do

      assert_select "input#estagiario_especialidade[name=?]", "estagiario[especialidade]"
    end
  end
end
