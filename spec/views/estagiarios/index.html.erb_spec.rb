require 'rails_helper'

RSpec.describe "estagiarios/index", type: :view do
  before(:each) do
    assign(:estagiarios, [
      Estagiario.create!(
        :especialidade => "Especialidade"
      ),
      Estagiario.create!(
        :especialidade => "Especialidade"
      )
    ])
  end

  it "renders a list of estagiarios" do
    render
    assert_select "tr>td", :text => "Especialidade".to_s, :count => 2
  end
end
