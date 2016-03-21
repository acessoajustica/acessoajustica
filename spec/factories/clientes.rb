FactoryGirl.define do
  factory :cliente do
    nome "Joana Silveira"
    cpf "123.456.789-00"
    nome_da_mae "Maria da Penha"
    rg "12.345.678-9"
    cor "Negro"
    identidade_de_genero "Homem"
    familia_renda 1500.00
    profissao_nome "Assistente Administrativo"
    familia_quantidade 9
    contribuintes_quantidade 4

    trait :cliente_with_atendimento do
      atendimentos  [FactoryGirl.build(:atendimento)]
    end

    trait :cliente_invalid do
      nome nil
    end
    trait :another do
      nome "Mario da Silva"
    end
  end
end
