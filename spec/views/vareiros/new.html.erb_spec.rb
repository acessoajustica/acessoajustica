require 'rails_helper'

RSpec.describe "vareiros/new", type: :view do
  before(:each) do
    assign(:vareiro, Vareiro.new(
      :forum => "MyString"
    ))
  end

  it "renders new vareiro form" do
    render

    assert_select "form[action=?][method=?]", vareiros_path, "post" do

      assert_select "input#vareiro_forum[name=?]", "vareiro[forum]"
    end
  end
end
