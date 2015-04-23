require 'rails_helper'

RSpec.describe "estagiarios/new", type: :view do
  before(:each) do
    assign(:estagiario, Estagiario.new(
      :especialidade => "MyString"
    ))
  end

  it "renders new estagiario form" do
    render

    assert_select "form[action=?][method=?]", estagiarios_path, "post" do

      assert_select "input#estagiario_especialidade[name=?]", "estagiario[especialidade]"
    end
  end
end
