require 'rails_helper'

RSpec.describe "membros/show", type: :view do
  before(:each) do
    @membro = assign(:membro, Membro.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
