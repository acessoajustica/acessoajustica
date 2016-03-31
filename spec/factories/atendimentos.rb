FactoryGirl.define do
  factory :atendimento do
    status true
    association :cliente, factory: :cliente, strategy: :build
    initial_description "Um relato inicial"
    detailed_description "Um relato detalhado"

    trait :old do
      created_at Date.new(1970, 1, 1)
    end

    trait :rejected do
      status false
    end

    trait :invalid do
      initial_description nil
    end

    trait :restless do
      initial_description "Um relato inicial"
      detailed_description "Um relato detalhado"
    end
  end
end
