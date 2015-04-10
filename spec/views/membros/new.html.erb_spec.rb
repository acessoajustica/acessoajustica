require 'rails_helper'

RSpec.describe "membros/new", type: :view do
  before(:each) do
    assign(:membro, Membro.new())
  end

  it "renders new membro form" do
    render

    assert_select "form[action=?][method=?]", membros_path, "post" do
    end
  end
end
