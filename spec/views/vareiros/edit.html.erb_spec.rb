require 'rails_helper'

RSpec.describe "vareiros/edit", type: :view do
  before(:each) do
    @vareiro = assign(:vareiro, Vareiro.create!(
      :forum => "MyString"
    ))
  end

  it "renders the edit vareiro form" do
    render

    assert_select "form[action=?][method=?]", vareiro_path(@vareiro), "post" do

      assert_select "input#vareiro_forum[name=?]", "vareiro[forum]"
    end
  end
end
