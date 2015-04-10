require 'rails_helper'

RSpec.describe "membros/edit", type: :view do
  before(:each) do
    @membro = assign(:membro, Membro.create!())
  end

  it "renders the edit membro form" do
    render

    assert_select "form[action=?][method=?]", membro_path(@membro), "post" do
    end
  end
end
