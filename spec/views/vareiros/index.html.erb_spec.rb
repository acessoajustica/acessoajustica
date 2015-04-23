require 'rails_helper'

RSpec.describe "vareiros/index", type: :view do
  before(:each) do
    assign(:vareiros, [
      Vareiro.create!(
        :forum => "Forum"
      ),
      Vareiro.create!(
        :forum => "Forum"
      )
    ])
  end

  it "renders a list of vareiros" do
    render
    assert_select "tr>td", :text => "Forum".to_s, :count => 2
  end
end
