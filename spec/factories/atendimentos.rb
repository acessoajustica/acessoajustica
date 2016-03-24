FactoryGirl.define do
  factory :atendimento do
    status true
    # association :cliente, factory: :cliente, strategy: :build
    #association :cliente, factory: :cliente, strategy: :build
    association :cliente, factory: :cliente, strategy: :build
    #cliente FactoryGirl.create(:cliente)
    initial_description "Um relato inicial"
    detailed_description "Um relato detalhado"
  end

  trait :old do
    created_at Date.new(1970, 1, 1)
  end

  trait :rejected do
    status false
  end

  trait :invalid do
    cliente nil
    initial_description nil
  end

  trait :restless do
    initial_description "Um relato inicial"
    detailed_description "Um relato detalhado"
  end
end
