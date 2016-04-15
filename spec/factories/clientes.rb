FactoryGirl.define do
  factory :cliente do
    nome "Joana Silveira"
    cpf "123.456.789-00"
    nome_da_mae "Maria da Penha"
    rg "12.345.678-9"
    identidade_de_genero "Homem"
    familia_renda 1500.00
    profissao_nome "Assistente Administrativo"
    familia_quantidade 9
    contribuintes_quantidade 4
    aprovado true

    trait :cliente_with_atendimento do
      after(:stub) do |c|
        c.atendimentos = [build_stubbed(:atendimento)]
      end
      after(:build) do |c|
        c.atendimentos = [build(:atendimento)]
      end
      after(:create) do |c|
        c.atendimentos = [create(:atendimento)]
      end
    end

    trait :cliente_invalid do
      nome nil
    end

    trait :another do
      nome "Mario da Silva"
    end
  end
end
