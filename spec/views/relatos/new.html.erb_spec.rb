require 'rails_helper'

RSpec.describe "relatos/new", type: :view do
  before(:each) do
    assign(:relato, Relato.new(
      :description => "MyString",
      :caso => nil
    ))
  end

  it "renders new relato form" do
    render

    assert_select "form[action=?][method=?]", relatos_path, "post" do

      assert_select "input#relato_description[name=?]", "relato[description]"

      assert_select "input#relato_caso_id[name=?]", "relato[caso_id]"
    end
  end
end
