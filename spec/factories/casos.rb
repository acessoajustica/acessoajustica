FactoryGirl.define do
  factory :caso do
    status true
    relatos [Relato.new({:description => 'Uma descrição'})]
  end
end