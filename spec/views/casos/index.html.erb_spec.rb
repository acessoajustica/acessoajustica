require 'rails_helper'

RSpec.describe "casos/index", type: :view do
  before(:each) do
    assign(:casos, [
      Caso.create!(
        :status => false,
        :cliente => nil
      ),
      Caso.create!(
        :status => false,
        :cliente => nil
      )
    ])
  end

  it "renders a list of casos" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
