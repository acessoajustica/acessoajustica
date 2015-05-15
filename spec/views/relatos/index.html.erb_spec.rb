require 'rails_helper'

RSpec.describe "relatos/index", type: :view do
  before(:each) do
    assign(:relatos, [
      Relato.create!(
        :description => "Description",
        :caso => nil
      ),
      Relato.create!(
        :description => "Description",
        :caso => nil
      )
    ])
  end

  it "renders a list of relatos" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
