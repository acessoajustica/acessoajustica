FactoryGirl.define do
  factory :pessoa do
    nome "João da Silva"
    cpf "123.456.789-00"
    nome_da_mae "Maria da Penha"
    rg "12.345.678-9"
    identidade_de_genero "Homem"

    trait :pessoa_invalid do
      nome nil
    end
    trait :new_pessoa do
      nome "Mario da Silva"
    end
  end
end
