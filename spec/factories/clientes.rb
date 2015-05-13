FactoryGirl.define do
  factory :cliente do
    nome "João da Silva"
    cpf "123.456.789-00"
    nome_da_mae "Maria da Penha"
    rg "12.345.678-9"
    cor "Negro"
    identidade_de_genero "Homem"
    # familia_renda 1500.00
    # filhos_quantidade 6
    # profissao_nome "Assistente Administrativo"
    # familia_quantidade 9
    # contribuintes_quantidade 4

    trait :pessoa_invalid do
      nome nil
    end
    trait :new_pessoa do
      nome "Mario da Silva"
    end
  end
end
