require 'rails_helper'

RSpec.describe "casos/index", type: :view do
  before(:each) do
    assign(:casos, [
      Caso.create!(
        :status => false
      ),
      Caso.create!(
        :status => false
      )
    ])
  end

  it "renders a list of casos" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
