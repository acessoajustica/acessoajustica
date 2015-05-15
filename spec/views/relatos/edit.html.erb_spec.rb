require 'rails_helper'

RSpec.describe "relatos/edit", type: :view do
  before(:each) do
    @relato = assign(:relato, Relato.create!(
      :description => "MyString",
      :caso => nil
    ))
  end

  it "renders the edit relato form" do
    render

    assert_select "form[action=?][method=?]", relato_path(@relato), "post" do

      assert_select "input#relato_description[name=?]", "relato[description]"

      assert_select "input#relato_caso_id[name=?]", "relato[caso_id]"
    end
  end
end
