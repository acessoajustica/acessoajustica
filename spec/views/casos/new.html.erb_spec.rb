require 'rails_helper'

RSpec.describe "casos/new", type: :view do
  before(:each) do
    assign(:caso, Caso.new(
      :status => false
    ))
  end

  it "renders new caso form" do
    render

    assert_select "form[action=?][method=?]", casos_path, "post" do

      assert_select "input#caso_status[name=?]", "caso[status]"
    end
  end
end
