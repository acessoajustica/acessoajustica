require 'rails_helper'

RSpec.describe "casos/edit", type: :view do
  before(:each) do
    @caso = assign(:caso, Caso.create!(
      :status => false,
      :cliente => nil
    ))
  end

  it "renders the edit caso form" do
    render

    assert_select "form[action=?][method=?]", caso_path(@caso), "post" do

      assert_select "input#caso_status[name=?]", "caso[status]"

      assert_select "input#caso_cliente_id[name=?]", "caso[cliente_id]"
    end
  end
end
