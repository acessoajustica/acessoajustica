FactoryGirl.define do
  factory :caso do
    status true
    # association :cliente, factory: :cliente, strategy: :build
    cliente Cliente.new()
    # association :cliente, factory: :cliente, strategy: :build
    relatos [Relato.new({:description => 'Uma descrição'})]

    trait :old do
      created_at Date.new(1970, 1, 1)
    end

    trait :rejected do
      status false
    end

    trait :invalid do
      cliente nil
    end
  end
end
