FactoryGirl.define do
  factory :atendimento do
    status true
    # association :cliente, factory: :cliente, strategy: :build
    cliente Cliente.new()
    # association :cliente, factory: :cliente, strategy: :build
  end

  trait :old do
    created_at Date.new(1970, 1, 1)
  end

  trait :rejected do
    status false
  end

  trait :invalid do
    cliente nil
  end

  trait :restless do
    relatos ['Uma descrição',
             'Outra descrição',
             'Mais uma descrição']
  end
end
